module Crypto.Symmetric.Poly1305.Bignum

open FStar.Mul
open FStar.Ghost
(** Machine integers *)
open FStar.UInt64
(** Effects and memory layout *)
open FStar.HyperStack
open FStar.HST
(** Buffers *)
open FStar.Buffer
(** Mathematical definitions *)
open Math.Axioms
open Math.Lib
open Math.Lemmas

open Crypto.Symmetric.Poly1305.Parameters
open Crypto.Symmetric.Poly1305.Bigint

module U32 = FStar.UInt32
module U64 = FStar.UInt64
module HS = FStar.HyperStack

open FStar.Buffer.Quantifiers
open Crypto.Symmetric.Poly1305.Bignum.Lemmas.Part1
open Crypto.Symmetric.Poly1305.Bignum.Lemmas.Part2

let prime = prime
let satisfiesModuloConstraints = satisfiesModuloConstraints
let isSum = isSum
let bound27 = bound27
let w : U32.t -> Tot int = U32.v


(*** Addition ***)

#reset-options "--z3timeout 20 --initial_fuel 0 --max_fuel 0"

private val fsum_: a:bigint -> b:bigint{disjoint a b} -> Stack unit
  (requires (fun h -> norm h a /\ norm h b))
  (ensures (fun h0 u h1 -> norm h0 a /\ norm h0 b /\ live h1 a /\ modifies_1 a h0 h1 /\ isSum h0 h1 a b))
let fsum_ a b =
  let h0 = HST.get() in
  let a0 = a.(0ul) in
  let a1 = a.(1ul) in
  let a2 = a.(2ul) in
  let a3 = a.(3ul) in
  let a4 = a.(4ul) in
  let b0 = b.(0ul) in
  let b1 = b.(1ul) in
  let b2 = b.(2ul) in
  let b3 = b.(3ul) in
  let b4 = b.(4ul) in
  assert(v a0 = v (get h0 a 0)); assert(v a1 = v (get h0 a 1)); assert(v a2 = v (get h0 a 2));
  assert(v a3 = v (get h0 a 3)); assert(v a4 = v (get h0 a 4)); assert(v b0 = v (get h0 b 0));
  assert(v b1 = v (get h0 b 1)); assert(v b2 = v (get h0 b 2)); assert(v b3 = v (get h0 b 3));
  assert(v b4 = v (get h0 b 4));
  lemma_fsum_0 a0 a1 a2 a3 a4 b0 b1 b2 b3 b4;
  let ab0 = a0 +^ b0 in
  let ab1 = a1 +^ b1 in
  let ab2 = a2 +^ b2 in
  let ab3 = a3 +^ b3 in
  let ab4 = a4 +^ b4 in
  a.(0ul) <- ab0;
  a.(1ul) <- ab1;
  a.(2ul) <- ab2;
  a.(3ul) <- ab3;
  a.(4ul) <- ab4

val fsum': a:bigint -> b:bigint{disjoint a b} -> Stack unit
    (requires (fun h -> norm h a /\ norm h b))
    (ensures (fun h0 u h1 -> norm h0 a /\ norm h0 b /\ bound27 h1 a /\ modifies_1 a h0 h1
      /\ eval h1 a norm_length = eval h0 a norm_length + eval h0 b norm_length
    ))
let fsum' a b =
  let h0 = HST.get() in
  fsum_ a b;
  let h1 = HST.get() in
  lemma_fsum h0 h1 a b

private val update_9: c:bigint{length c >= 2*norm_length-1} ->
  c0:U64.t -> c1:U64.t -> c2:U64.t ->
  c3:U64.t -> c4:U64.t -> c5:U64.t ->
  c6:U64.t -> c7:U64.t -> c8:U64.t ->
  Stack unit
    (requires (fun h -> live h c))
    (ensures  (fun h0 _ h1 -> live h1 c /\ modifies_1 c h0 h1
      /\ get h1 c 0 == c0 /\ get h1 c 1 == c1 /\ get h1 c 2 == c2
      /\ get h1 c 3 == c3 /\ get h1 c 4 == c4 /\ get h1 c 5 == c5
      /\ get h1 c 6 == c6 /\ get h1 c 7 == c7 /\ get h1 c 8 == c8))
let update_9 c c0 c1 c2 c3 c4 c5 c6 c7 c8 =
  c.(0ul) <- c0;
  c.(1ul) <- c1;
  c.(2ul) <- c2;
  c.(3ul) <- c3;
  c.(4ul) <- c4;
  c.(5ul) <- c5;
  c.(6ul) <- c6;
  c.(7ul) <- c7;
  c.(8ul) <- c8

#reset-options "--z3timeout 20 --initial_fuel 0 --max_fuel 0"

private val multiplication_0:
  c:bigint{length c >= 2*norm_length-1} ->
  a0:u27 -> a1:u27 -> a2:u27 -> a3:u27 -> a4:u27 ->
  b0:u26 -> b1:u26 -> b2:u26 -> b3:u26 -> b4:u26 ->
  Stack unit
    (requires (fun h -> live h c))
    (ensures  (fun h0 _ h1 -> modifies_1 c h0 h1 /\ live h1 c
      /\ isMultiplication_ h1 (v a0) (v a1) (v a2) (v a3) (v a4) (v b0) (v b1) (v b2) (v b3) (v b4) c))
let multiplication_0 c a0 a1 a2 a3 a4 b0 b1 b2 b3 b4 =
  lemma_multiplication_0 a0 a1 a2 a3 a4 b0 b1 b2 b3 b4;
  let ab00 = a0 *^ b0 in
  let ab01 = a0 *^ b1 in
  let ab02 = a0 *^ b2 in
  let ab03 = a0 *^ b3 in
  let ab04 = a0 *^ b4 in
  let ab10 = a1 *^ b0 in
  let ab11 = a1 *^ b1 in
  let ab12 = a1 *^ b2 in
  let ab13 = a1 *^ b3 in
  let ab14 = a1 *^ b4 in
  let ab20 = a2 *^ b0 in
  let ab21 = a2 *^ b1 in
  let ab22 = a2 *^ b2 in
  let ab23 = a2 *^ b3 in
  let ab24 = a2 *^ b4 in
  let ab30 = a3 *^ b0 in
  let ab31 = a3 *^ b1 in
  let ab32 = a3 *^ b2 in
  let ab33 = a3 *^ b3 in
  let ab34 = a3 *^ b4 in
  let ab40 = a4 *^ b0 in
  let ab41 = a4 *^ b1 in
  let ab42 = a4 *^ b2 in
  let ab43 = a4 *^ b3 in
  let ab44 = a4 *^ b4 in
  let c0 = ab00 in
  let c1 = ab01 +^ ab10 in
  let c2 = ab02 +^ ab11 +^ ab20 in
  let c3 = ab03 +^ ab12 +^ ab21 +^ ab30 in
  let c4 = ab04 +^ ab13 +^ ab22 +^ ab31 +^ ab40 in
  let c5 = ab14 +^ ab23 +^ ab32 +^ ab41 in
  let c6 = ab24 +^ ab33 +^ ab42 in
  let c7 = ab34 +^ ab43 in
  let c8 = ab44 in
  update_9 c c0 c1 c2 c3 c4 c5 c6 c7 c8

private val multiplication_:
  c:bigint{length c >= 2 * norm_length - 1} ->
  a:bigint{disjoint c a} ->
  b:bigint{disjoint c b} ->
  Stack unit
     (requires (fun h -> bound27 h a /\ norm h b /\ live h c))
     (ensures (fun h0 u h1 -> bound27 h0 a /\ norm h0 b /\ live h1 c /\ modifies_1 c h0 h1
       /\ isMultiplication h0 h1 a b c
     ))
let multiplication_ c a b =
  let h0 = HST.get() in
  let a0 = a.(0ul) in let a1 = a.(1ul) in let a2 = a.(2ul) in let a3 = a.(3ul) in let a4 = a.(4ul) in
  let b0 = b.(0ul) in let b1 = b.(1ul) in let b2 = b.(2ul) in let b3 = b.(3ul) in let b4 = b.(4ul) in
  multiplication_0 c a0 a1 a2 a3 a4 b0 b1 b2 b3 b4

val multiplication:
  c:bigint{length c >= 2 * norm_length - 1} ->
  a:bigint{disjoint c a} ->
  b:bigint{disjoint c b} ->
  Stack unit
     (requires (fun h -> bound27 h a /\ norm h b /\ live h c))
     (ensures (fun h0 u h1 -> bound27 h0 a /\ norm h0 b /\ live h1 c /\ modifies_1 c h0 h1
       /\ eval h1 c (2*norm_length-1) = eval h0 a (norm_length) * eval h0 b (norm_length)
       /\ maxValue h1 c (2*norm_length-1) <= norm_length * pow2 53
     ))
let multiplication c a b =
  let h0 = HST.get() in
  multiplication_ c a b;
  let h1 = HST.get() in
  lemma_multiplication h0 h1 c a b


#reset-options "--z3timeout 5 --initial_fuel 3 --max_fuel 3"

val times_5: b:U64.t{5 * v b < pow2 64} -> Tot (b':U64.t{v b' = 5 * v b})
let times_5 b = (b <<^ 2ul) +^ b

#reset-options "--z3timeout 20 --initial_fuel 0 --max_fuel 0"

val freduce_degree_: b:bigint -> Stack unit
  (requires (fun h -> live h b /\ satisfiesModuloConstraints h b))
  (ensures (fun h0 _ h1 -> live h0 b /\ live h1 b /\ modifies_1 b h0 h1
    /\ isDegreeReduced h0 h1 b))
let freduce_degree_ b =
  let h0 = HST.get() in
  let b0 = b.(0ul) in
  let b1 = b.(1ul) in
  let b2 = b.(2ul) in
  let b3 = b.(3ul) in
  let b5 = b.(5ul) in
  let b6 = b.(6ul) in
  let b7 = b.(7ul) in
  let b8 = b.(8ul) in
  lemma_freduce_degree_0 h0 b;
  let b0' = b0 +^ times_5 b5 in
  let b1' = b1 +^ times_5 b6 in
  let b2' = b2 +^ times_5 b7 in
  let b3' = b3 +^ times_5 b8 in
  b.(0ul) <- b0';
  b.(1ul) <- b1';
  b.(2ul) <- b2';
  b.(3ul) <- b3'


val freduce_degree: b:bigint -> Stack unit
  (requires (fun h -> satisfiesModuloConstraints h b))
  (ensures (fun h0 _ h1 -> live h0 b /\ live h1 b /\ modifies_1 b h0 h1
    /\ satisfiesModuloConstraints h0 b
    /\ bound63 h1 b
    /\ eval h1 b norm_length % reveal prime = eval h0 b (2*norm_length-1) % reveal prime
  ))
let freduce_degree b =
  let h0 = HST.get() in
  freduce_degree_ b;
  let h1 = HST.get() in
  lemma_freduce_degree h0 h1 b

private val mod2_26: x:U64.t -> Tot (y:U64.t{v y = v x % pow2 26 /\ v y < pow2 26})
let mod2_26 x =
  let y = x &^ 0x3ffffffuL in
  assume (v y = v x % pow2 26);
  y

private val div2_26: x:U64.t -> Tot (y:U64.t{v y = v x / pow2 26 /\ v y <= pow2 38})
let div2_26 x = pow2_minus 64 26; x >>^ 26ul

#reset-options "--z3timeout 20 --initial_fuel 0 --max_fuel 0"

private val update_5: c:bigint ->
  c0:U64.t -> c1:U64.t -> c2:U64.t ->
  c3:U64.t -> c4:U64.t ->
  Stack unit
    (requires (fun h -> live h c))
    (ensures  (fun h0 _ h1 -> live h1 c /\ modifies_1 c h0 h1
      /\ get h1 c 0 == c0 /\ get h1 c 1 == c1 /\ get h1 c 2 == c2
      /\ get h1 c 3 == c3 /\ get h1 c 4 == c4))
let update_5 c c0 c1 c2 c3 c4 =
  c.(0ul) <- c0;
  c.(1ul) <- c1;
  c.(2ul) <- c2;
  c.(3ul) <- c3;
  c.(4ul) <- c4

#reset-options "--z3timeout 20 --initial_fuel 0 --max_fuel 0"

private val update_6: c:bigint{length c >= norm_length+1} ->
  c0:U64.t -> c1:U64.t -> c2:U64.t ->
  c3:U64.t -> c4:U64.t -> c5:U64.t ->
  Stack unit
    (requires (fun h -> live h c))
    (ensures  (fun h0 _ h1 -> live h1 c /\ modifies_1 c h0 h1
      /\ get h1 c 0 == c0 /\ get h1 c 1 == c1 /\ get h1 c 2 == c2
      /\ get h1 c 3 == c3 /\ get h1 c 4 == c4 /\ get h1 c 5 == c5))
let update_6 c c0 c1 c2 c3 c4 c5  =
  c.(0ul) <- c0;
  c.(1ul) <- c1;
  c.(2ul) <- c2;
  c.(3ul) <- c3;
  c.(4ul) <- c4;
  c.(5ul) <- c5

#reset-options "--z3timeout 20 --initial_fuel 0 --max_fuel 0"


private val carry_1_0:
  b:bigint{length b >= norm_length+1} ->
  b0:u633 -> b1:u633 -> b2:u633 -> b3:u633 -> b4:u633 ->
  Stack unit
    (requires (fun h -> bound63 h b))
    (ensures (fun h0 _ h1 -> bound63 h0 b /\ norm h1 b /\ modifies_1 b h0 h1
      /\ isCarried_ h1 b0 b1 b2 b3 b4 b ))
let carry_1_0 b b0 b1 b2 b3 b4 =
  pow2_lt_compat 39 38; pow2_lt_compat 63 39; pow2_double_sum 63;
  assert(forall x y. {:pattern (v x + v y)}(v x < pow2 63 /\ v y <= pow2 38)
    ==> v x + v y < pow2 64);
  let b0' = mod2_26 b0 in
  let r0  = div2_26 b0 in
  let b1' = mod2_26 (b1 +^ r0) in
  let r1  = div2_26 (b1 +^ r0) in
  let b2' = mod2_26 (b2 +^ r1) in
  let r2  = div2_26 (b2 +^ r1) in
  let b3' = mod2_26 (b3 +^ r2) in
  let r3  = div2_26 (b3 +^ r2) in
  let b4' = mod2_26 (b4 +^ r3) in
  let b5' = div2_26 (b4 +^ r3) in
  update_6 b b0' b1' b2' b3' b4' b5'


#reset-options "--z3timeout 20 --initial_fuel 0 --max_fuel 0"

private val carry_1_:
  b:bigint{length b >= norm_length+1} ->
  Stack unit
    (requires (fun h -> bound63 h b))
    (ensures (fun h0 _ h1 -> bound63 h0 b /\ norm h1 b /\ modifies_1 b h0 h1
      /\ isCarried h0 h1 b
    ))
let carry_1_ b =
  let b0 = b.(0ul) in
  let b1 = b.(1ul) in
  let b2 = b.(2ul) in
  let b3 = b.(3ul) in
  let b4 = b.(4ul) in
  carry_1_0 b b0 b1 b2 b3 b4

val carry_1:
  b:bigint{length b >= norm_length+1} ->
  Stack unit
    (requires (fun h -> bound63 h b))
    (ensures (fun h0 _ h1 -> bound63 h0 b /\ norm h1 b /\ modifies_1 b h0 h1
      /\ eval h1 b (norm_length+1) = eval h0 b norm_length /\ carried_1 h1 b
    ))
let carry_1 b =
  let h0 = HST.get() in
  carry_1_ b;
  let h1 = HST.get() in
  lemma_carry_1 h0 h1 b

val carry_2_: b:bigint -> Stack unit
  (requires (fun h -> carried_2 h b))
  (ensures (fun h0 _ h1 -> live h0 b /\ norm h1 b /\ modifies_1 b h0 h1
    /\ isCarried h0 h1 b
  ))
let carry_2_ b =
  pow2_lt_compat 63 42; pow2_lt_compat 63 26;
  carry_1_ b

val carry_2: b:bigint -> Stack unit
  (requires (fun h -> carried_2 h b))
  (ensures (fun h0 _ h1 -> carried_2 h0 b /\ norm h1 b /\ modifies_1 b h0 h1
	  /\ eval h1 b (norm_length+1) = eval h0 b norm_length
	  /\ carried_3 h1 b))
let carry_2 b =
  let h0 = HST.get() in
  carry_2_ b;
  let h1 = HST.get() in
  lemma_carry_2 h0 h1 b


val carry_top_: b:bigint -> Stack unit
  (requires (fun h -> live h b /\ length b >= norm_length+1
    /\ v (get h b 0) + 5 * v (get h b 5) < pow2 64 ))
  (ensures  (fun h0 _ h1 -> live h1 b /\ modifies_1 b h0 h1
    /\ carriedTopBottom h0 h1 b))
let carry_top_ b =
  let b0 = b.(0ul) in
  let b5 = b.(5ul) in
  b.(0ul) <- b0 +^ times_5 b5


val carry_top_1: b:bigint -> Stack unit
  (requires (fun h -> carried_1 h b))
  (ensures  (fun h0 _ h1 -> carried_1 h0 b /\ carried_2 h1 b /\ modifies_1 b h0 h1
    /\ eval h1 b norm_length % reveal prime = eval h0 b (norm_length+1) % reveal prime))
let carry_top_1 b =
  let h0 = HST.get() in
  pow2_double_sum 38; pow2_double_sum 39;  pow2_double_sum 40;
  pow2_lt_compat 63 26;  pow2_lt_compat 63 41;
  carry_top_ b;
  let h1 = HST.get() in
  lemma_carry_top_1 h0 h1 b


val carry_top_2: b:bigint -> Stack unit
  (requires (fun h -> carried_3 h b))
  (ensures  (fun h0 _ h1 -> carried_3 h0 b /\ carried_4 h1 b /\ modifies_1 b h0 h1
    /\ eval h1 b norm_length % reveal prime = eval h0 b (norm_length+1) % reveal prime))
let carry_top_2 b =
  let h0 = HST.get() in
  pow2_double_sum 0; pow2_double_sum 1;  pow2_double_sum 2;
  pow2_lt_compat 63 26;  pow2_lt_compat 63 3;
  carry_top_ b;
  let h1 = HST.get() in
  lemma_carry_top_2 h0 h1 b


private val carry_0_to_1_:
  b:bigint ->
  Stack unit
    (requires (fun h -> carried_4 h b))
    (ensures  (fun h0 _ h1 -> isCarried01 h0 h1 b /\ modifies_1 b h0 h1))
let carry_0_to_1_ b =
  pow2_lt_compat 63 38; pow2_lt_compat 63 26; pow2_double_sum 63;
  let b0 = b.(0ul) in
  let b1 = b.(1ul) in
  let b0' = mod2_26 b0 in
  let r0  = div2_26 b0 in
  b.(0ul) <- b0';
  b.(1ul) <- b1 +^ r0

val carry_0_to_1: b:bigint -> Stack unit
  (requires (fun h -> carried_4 h b))
  (ensures  (fun h0 _ h1 -> carried_4 h0 b /\ modifies_1 b h0 h1 /\ norm h1 b
    /\ eval h1 b norm_length = eval h0 b norm_length))
let carry_0_to_1 b =
  let h0 = HST.get() in
  carry_0_to_1_ b;
  let h1 = HST.get() in
  lemma_carry_0_to_1 h0 h1 b


val freduce_coefficients: b:bigint{length b >= norm_length + 1} -> Stack unit
  (requires (fun h -> bound63 h b))
  (ensures (fun h0 _ h1 -> bound63 h0 b /\ norm h1 b /\ modifies_1 b h0 h1
    /\ eval h1 b norm_length % reveal prime = eval h0 b norm_length % reveal prime
    ))
let freduce_coefficients b =
  carry_1 b;
  carry_top_1 b;
  carry_2 b;
  carry_top_2 b;
  carry_0_to_1 b


val modulo: b:bigint -> Stack unit
  (requires (fun h -> live h b /\ satisfiesModuloConstraints h b))
  (ensures (fun h0 _ h1 -> live h0 b /\ satisfiesModuloConstraints h0 b /\ norm h1 b /\ modifies_1 b h0 h1
    /\ eval h1 b norm_length % reveal prime = eval h0 b (2*norm_length-1) % reveal prime))
let modulo b =
  freduce_degree b;
  freduce_coefficients b


#set-options "--lax"

val finalize: b:bigint -> Stack unit
  (requires (fun h -> norm h b))
  (ensures (fun h0 _ h1 -> norm h0 b /\ norm h1 b /\ modifies_1 b h0 h1
    /\ eval h1 b norm_length = eval h0 b norm_length % reveal prime))
let finalize b =
  let mask_26 = U64 ((1uL <<^ 26ul) -^ 1uL) in
  let mask2_26m5 = U64 (mask_26 -^ (1uL <<^ 2ul)) in
  let b0 = b.(0ul) in
  let b1 = b.(1ul) in
  let b2 = b.(2ul) in
  let b3 = b.(3ul) in
  let b4 = b.(4ul) in
  let mask = U64.eq_mask b4 mask_26 in
  let mask = U64.eq_mask b3 mask_26 &^ mask in
  let mask = U64.eq_mask b2 mask_26 &^ mask in
  let mask = U64.eq_mask b1 mask_26 &^ mask in
  let mask = U64.gte_mask b0 mask2_26m5 &^ mask in
  b.(0ul) <- (b0 -^ (mask &^ mask2_26m5));
  b.(1ul) <- (b1 -^ (b1 &^ mask));
  b.(2ul) <- (b2 -^ (b2 &^ mask));
  b.(3ul) <- (b3 -^ (b3 &^ mask));
  b.(4ul) <- (b4 -^ (b4 &^ mask))
