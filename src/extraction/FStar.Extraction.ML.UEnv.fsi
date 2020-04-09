(*
   Copyright 2008-2015 Abhishek Anand, Nikhil Swamy and Microsoft Research

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*)

#light "off"
module FStar.Extraction.ML.UEnv
open FStar.ST
open FStar.All
open FStar
open FStar.Util
open FStar.Ident
open FStar.Extraction.ML.Syntax
open FStar.Syntax
open FStar.Syntax.Syntax
open FStar.TypeChecker

(** This module provides a typing environment used for extracting
    programs to ML.
    
    See the implementation for more detailed descriptions. *)


(**** Types *)

type ty_binding = {
  ty_b_name:mlident;
  ty_b_ty:mlty
}

type exp_binding = {
  exp_b_name:mlident;
  exp_b_expr:mlexpr;
  exp_b_tscheme:mltyscheme
}

type ty_or_exp_b = either<ty_binding, exp_binding>

type binding =
  | Bv  of bv * ty_or_exp_b
  | Fv  of fv * exp_binding

(** Type abbreviations, aka definitions *)
type tydef
val tydef_fv : tydef -> fv
val tydef_mlpath : tydef -> mlpath
val tydef_def: tydef -> mltyscheme

(** The main type of this module *)
type uenv 
val tcenv_of_uenv : u:uenv -> TypeChecker.Env.env
val set_tcenv : u:uenv -> t:TypeChecker.Env.env -> uenv
val current_module_of_uenv : u:uenv -> mlpath
val set_current_module : u:uenv -> p:mlpath -> uenv

(** Debugging only *)
val bindings_of_uenv : uenv -> list<binding>
val debug: g:uenv -> f:(unit -> unit) -> unit

(** Constructor *)
val new_uenv : e:TypeChecker.Env.env -> uenv

(*** Looking up identifiers *)

(** Lookup a top-level term identifier *)
val try_lookup_fv: g:uenv -> fv:fv -> option<exp_binding>
val lookup_fv: g:uenv -> fv:fv -> exp_binding

(** Lookup a local term or type variable *)
val lookup_bv: g:uenv -> bv: bv -> ty_or_exp_b

(** Lookup a top-level term or local type variable *)
val lookup_term: g:uenv -> t:term -> ty_or_exp_b * option<fv_qual>

(** Lookup a type variable *)
val lookup_ty: g:uenv -> bv:bv -> ty_binding

(** Lookup a type abbreviation, definition *)
val lookup_ty_const : uenv -> mlpath -> option<mltyscheme>

val mlpath_of_lident : uenv -> lident -> mlpath

val is_type_name : g:uenv -> fv:fv -> bool

val is_fv_type: uenv -> fv -> bool
                               
val lookup_record_field_name : uenv -> 
                               (lident * ident) ->
                               mlpath

(*** Extending environment *)


val new_mlident : g:uenv -> uenv * mlident

val extend_ty: g:uenv -> a:bv -> map_to_top:bool -> uenv

val extend_bv:
    uenv ->
    bv ->
    mltyscheme ->
    add_unit: bool ->
    mk_unit:
      (*some pattern terms become unit while extracting*)
      bool
  -> uenv * mlident * exp_binding

val extend_fv: g:uenv -> x:fv -> t_x:mltyscheme -> add_unit:bool ->
               uenv * mlident * exp_binding

val extend_lb: g:uenv -> l:lbname -> t:typ -> t_x:mltyscheme -> add_unit:bool
               -> uenv * mlident * exp_binding

val extend_tydef : g:uenv -> fv:fv -> ts:mltyscheme -> tydef * mlpath * uenv

val extend_type_name: g:uenv -> fv:fv -> mlpath * uenv

val extend_with_monad_op_name : uenv ->
                          ed:Syntax.eff_decl ->
                          nm:string ->
                          ts:mltyscheme ->
                          mlpath *
                          lident *
                          exp_binding *
                          uenv

val extend_with_action_name: uenv ->
                             ed:Syntax.eff_decl ->
                             a:Syntax.action ->
                             ts:mltyscheme ->
                             mlpath *
                             lident *
                             exp_binding *
                             uenv
                             
val extend_record_field_name : uenv ->
                               (lident * ident) ->
                               mlpath * uenv

val extend_with_module_name : uenv -> 
                              lident ->
                              mlpath * uenv

val exit_module : uenv -> uenv
