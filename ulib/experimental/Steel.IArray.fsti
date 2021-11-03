(*
   Copyright 2021 Microsoft Research

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

   Authors: Aseem Rastogi
*)

module Steel.IArray

open Steel.Memory
open Steel.Effect
open Steel.Effect.Atomic

module G = FStar.Ghost
module Set = FStar.Set
module Map = FStar.Map
module U32 = FStar.UInt32

type u32 = FStar.UInt32.t

type hash_fn_t (k:eqtype) = k -> u32

val iarray (k:eqtype) (v:Type0) (h:hash_fn_t k) : Type0

type repr (k:eqtype) (v:Type0) = Map.t k v

let empty_repr (#k:eqtype) (#v:Type0) (x:v) : repr k v = Map.restrict Set.empty (Map.const x)

val ipts_to (#k:eqtype) (#v:Type0) (#h:hash_fn_t k) (arr:iarray k v h) (m:repr k v) : vprop

val create (#k:eqtype) (#v:Type0) (h:hash_fn_t k) (x:G.erased v) (n:u32{U32.v n > 0})
  : SteelT (iarray k v h)
      emp
      (fun a -> ipts_to a (empty_repr (G.reveal x)))

val index (#k:eqtype) (#v:Type0) (#h:hash_fn_t k) (#m:G.erased (repr k v))
  (a:iarray k v h) (i:k)
  : SteelT (option v)
      (ipts_to a m)
      (fun r ->
       ipts_to a m
         `star`
       pure (Some? r ==> r == Some (Map.sel m i)))

val upd (#k:eqtype) (#v:Type0) (#h:hash_fn_t k) (#m:G.erased (repr k v))
  (a:iarray k v h) (i:k) (x:v)
  : SteelT unit
      (ipts_to a m)
      (fun _ -> ipts_to a (Map.upd m i x))
