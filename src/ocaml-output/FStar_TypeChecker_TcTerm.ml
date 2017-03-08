
open Prims

let instantiate_both : FStar_TypeChecker_Env.env  ->  FStar_TypeChecker_Env.env = (fun env -> (

let uu___83_4 = env
in {FStar_TypeChecker_Env.solver = uu___83_4.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___83_4.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___83_4.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___83_4.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___83_4.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___83_4.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___83_4.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___83_4.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___83_4.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = true; FStar_TypeChecker_Env.effects = uu___83_4.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___83_4.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = uu___83_4.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = uu___83_4.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = uu___83_4.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = uu___83_4.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = uu___83_4.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___83_4.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = uu___83_4.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = uu___83_4.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___83_4.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___83_4.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = uu___83_4.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = uu___83_4.FStar_TypeChecker_Env.qname_and_index}))


let no_inst : FStar_TypeChecker_Env.env  ->  FStar_TypeChecker_Env.env = (fun env -> (

let uu___84_8 = env
in {FStar_TypeChecker_Env.solver = uu___84_8.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___84_8.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___84_8.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___84_8.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___84_8.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___84_8.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___84_8.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___84_8.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___84_8.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = false; FStar_TypeChecker_Env.effects = uu___84_8.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___84_8.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = uu___84_8.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = uu___84_8.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = uu___84_8.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = uu___84_8.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = uu___84_8.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___84_8.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = uu___84_8.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = uu___84_8.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___84_8.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___84_8.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = uu___84_8.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = uu___84_8.FStar_TypeChecker_Env.qname_and_index}))


let mk_lex_list : (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax Prims.list  ->  (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax = (fun vs -> (FStar_List.fold_right (fun v tl -> (

let r = (match ((tl.FStar_Syntax_Syntax.pos = FStar_Range.dummyRange)) with
| true -> begin
v.FStar_Syntax_Syntax.pos
end
| uu____33 -> begin
(FStar_Range.union_ranges v.FStar_Syntax_Syntax.pos tl.FStar_Syntax_Syntax.pos)
end)
in (

let uu____34 = (

let uu____35 = (

let uu____36 = (FStar_Syntax_Syntax.as_arg v)
in (

let uu____37 = (

let uu____39 = (FStar_Syntax_Syntax.as_arg tl)
in (uu____39)::[])
in (uu____36)::uu____37))
in (FStar_Syntax_Syntax.mk_Tm_app FStar_Syntax_Util.lex_pair uu____35))
in (uu____34 (Some (FStar_Syntax_Util.lex_t.FStar_Syntax_Syntax.n)) r)))) vs FStar_Syntax_Util.lex_top))


let is_eq : FStar_Syntax_Syntax.arg_qualifier Prims.option  ->  Prims.bool = (fun uu___77_47 -> (match (uu___77_47) with
| Some (FStar_Syntax_Syntax.Equality) -> begin
true
end
| uu____49 -> begin
false
end))


let steps = (fun env -> (FStar_TypeChecker_Normalize.Beta)::(FStar_TypeChecker_Normalize.Eager_unfolding)::[])


let unfold_whnf : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun env t -> (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.WHNF)::(FStar_TypeChecker_Normalize.UnfoldUntil (FStar_Syntax_Syntax.Delta_constant))::(FStar_TypeChecker_Normalize.Beta)::[]) env t))


let norm : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun env t -> (FStar_TypeChecker_Normalize.normalize (steps env) env t))


let norm_c : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.comp = (fun env c -> (FStar_TypeChecker_Normalize.normalize_comp (steps env) env c))


let check_no_escape : FStar_Syntax_Syntax.term Prims.option  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.bv Prims.list  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun head_opt env fvs kt -> (

let rec aux = (fun try_norm t -> (match (fvs) with
| [] -> begin
t
end
| uu____100 -> begin
(

let t = (match (try_norm) with
| true -> begin
(norm env t)
end
| uu____103 -> begin
t
end)
in (

let fvs' = (FStar_Syntax_Free.names t)
in (

let uu____106 = (FStar_List.tryFind (fun x -> (FStar_Util.set_mem x fvs')) fvs)
in (match (uu____106) with
| None -> begin
t
end
| Some (x) -> begin
(match ((not (try_norm))) with
| true -> begin
(aux true t)
end
| uu____110 -> begin
(

let fail = (fun uu____114 -> (

let msg = (match (head_opt) with
| None -> begin
(

let uu____116 = (FStar_Syntax_Print.bv_to_string x)
in (FStar_Util.format1 "Bound variables \'%s\' escapes; add a type annotation" uu____116))
end
| Some (head) -> begin
(

let uu____118 = (FStar_Syntax_Print.bv_to_string x)
in (

let uu____119 = (FStar_TypeChecker_Normalize.term_to_string env head)
in (FStar_Util.format2 "Bound variables \'%s\' in the type of \'%s\' escape because of impure applications; add explicit let-bindings" uu____118 uu____119)))
end)
in (

let uu____120 = (

let uu____121 = (

let uu____124 = (FStar_TypeChecker_Env.get_range env)
in ((msg), (uu____124)))
in FStar_Errors.Error (uu____121))
in (Prims.raise uu____120))))
in (

let s = (

let uu____126 = (

let uu____127 = (FStar_Syntax_Util.type_u ())
in (FStar_All.pipe_left Prims.fst uu____127))
in (FStar_TypeChecker_Util.new_uvar env uu____126))
in (

let uu____132 = (FStar_TypeChecker_Rel.try_teq env t s)
in (match (uu____132) with
| Some (g) -> begin
((FStar_TypeChecker_Rel.force_trivial_guard env g);
s;
)
end
| uu____136 -> begin
(fail ())
end))))
end)
end))))
end))
in (aux false kt)))


let push_binding = (fun env b -> (FStar_TypeChecker_Env.push_bv env (Prims.fst b)))


let maybe_extend_subst : FStar_Syntax_Syntax.subst_t  ->  FStar_Syntax_Syntax.binder  ->  (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.subst_t = (fun s b v -> (

let uu____167 = (FStar_Syntax_Syntax.is_null_binder b)
in (match (uu____167) with
| true -> begin
s
end
| uu____168 -> begin
(FStar_Syntax_Syntax.NT ((((Prims.fst b)), (v))))::s
end)))


let set_lcomp_result : FStar_Syntax_Syntax.lcomp  ->  (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.lcomp = (fun lc t -> (

let uu___85_181 = lc
in {FStar_Syntax_Syntax.eff_name = uu___85_181.FStar_Syntax_Syntax.eff_name; FStar_Syntax_Syntax.res_typ = t; FStar_Syntax_Syntax.cflags = uu___85_181.FStar_Syntax_Syntax.cflags; FStar_Syntax_Syntax.comp = (fun uu____182 -> (

let uu____183 = (lc.FStar_Syntax_Syntax.comp ())
in (FStar_Syntax_Util.set_result_typ uu____183 t)))}))


let memo_tk : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.term = (fun e t -> ((FStar_ST.write e.FStar_Syntax_Syntax.tk (Some (t.FStar_Syntax_Syntax.n)));
e;
))


let value_check_expected_typ : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.typ, FStar_Syntax_Syntax.lcomp) FStar_Util.either  ->  FStar_TypeChecker_Env.guard_t  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env e tlc guard -> (

let should_return = (fun t -> (

let uu____222 = (

let uu____223 = (FStar_Syntax_Subst.compress t)
in uu____223.FStar_Syntax_Syntax.n)
in (match (uu____222) with
| FStar_Syntax_Syntax.Tm_arrow (uu____226, c) -> begin
(

let uu____238 = (FStar_TypeChecker_Util.is_pure_or_ghost_effect env (FStar_Syntax_Util.comp_effect_name c))
in (match (uu____238) with
| true -> begin
(

let t = (FStar_All.pipe_left FStar_Syntax_Util.unrefine (FStar_Syntax_Util.comp_result c))
in (

let uu____240 = (

let uu____241 = (FStar_Syntax_Subst.compress t)
in uu____241.FStar_Syntax_Syntax.n)
in (match (uu____240) with
| FStar_Syntax_Syntax.Tm_fvar (fv) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.unit_lid) -> begin
false
end
| FStar_Syntax_Syntax.Tm_constant (uu____245) -> begin
false
end
| uu____246 -> begin
true
end)))
end
| uu____247 -> begin
false
end))
end
| uu____248 -> begin
true
end)))
in (

let lc = (match (tlc) with
| FStar_Util.Inl (t) -> begin
(

let uu____251 = (

let uu____254 = ((

let uu____255 = (should_return t)
in (not (uu____255))) || (

let uu____256 = (FStar_TypeChecker_Env.should_verify env)
in (not (uu____256))))
in (match (uu____254) with
| true -> begin
(FStar_Syntax_Syntax.mk_Total t)
end
| uu____259 -> begin
(FStar_TypeChecker_Util.return_value env t e)
end))
in (FStar_Syntax_Util.lcomp_of_comp uu____251))
end
| FStar_Util.Inr (lc) -> begin
lc
end)
in (

let t = lc.FStar_Syntax_Syntax.res_typ
in (

let uu____264 = (

let uu____268 = (FStar_TypeChecker_Env.expected_typ env)
in (match (uu____268) with
| None -> begin
(

let uu____273 = (memo_tk e t)
in ((uu____273), (lc), (guard)))
end
| Some (t') -> begin
((

let uu____276 = (FStar_TypeChecker_Env.debug env FStar_Options.High)
in (match (uu____276) with
| true -> begin
(

let uu____277 = (FStar_Syntax_Print.term_to_string t)
in (

let uu____278 = (FStar_Syntax_Print.term_to_string t')
in (FStar_Util.print2 "Computed return type %s; expected type %s\n" uu____277 uu____278)))
end
| uu____279 -> begin
()
end));
(

let uu____280 = (FStar_TypeChecker_Util.maybe_coerce_bool_to_type env e lc t')
in (match (uu____280) with
| (e, lc) -> begin
(

let t = lc.FStar_Syntax_Syntax.res_typ
in (

let uu____291 = (FStar_TypeChecker_Util.check_and_ascribe env e t t')
in (match (uu____291) with
| (e, g) -> begin
((

let uu____300 = (FStar_TypeChecker_Env.debug env FStar_Options.High)
in (match (uu____300) with
| true -> begin
(

let uu____301 = (FStar_Syntax_Print.term_to_string t)
in (

let uu____302 = (FStar_Syntax_Print.term_to_string t')
in (

let uu____303 = (FStar_TypeChecker_Rel.guard_to_string env g)
in (

let uu____304 = (FStar_TypeChecker_Rel.guard_to_string env guard)
in (FStar_Util.print4 "check_and_ascribe: type is %s<:%s \tguard is %s, %s\n" uu____301 uu____302 uu____303 uu____304)))))
end
| uu____305 -> begin
()
end));
(

let msg = (

let uu____310 = (FStar_TypeChecker_Rel.is_trivial g)
in (match (uu____310) with
| true -> begin
None
end
| uu____316 -> begin
(FStar_All.pipe_left (fun _0_28 -> Some (_0_28)) (FStar_TypeChecker_Err.subtyping_failed env t t'))
end))
in (

let g = (FStar_TypeChecker_Rel.conj_guard g guard)
in (

let uu____325 = (FStar_TypeChecker_Util.strengthen_precondition msg env e lc g)
in (match (uu____325) with
| (lc, g) -> begin
(

let uu____333 = (memo_tk e t')
in ((uu____333), ((set_lcomp_result lc t')), (g)))
end))));
)
end)))
end));
)
end))
in (match (uu____264) with
| (e, lc, g) -> begin
((

let uu____341 = (FStar_TypeChecker_Env.debug env FStar_Options.Low)
in (match (uu____341) with
| true -> begin
(

let uu____342 = (FStar_Syntax_Print.lcomp_to_string lc)
in (FStar_Util.print1 "Return comp type is %s\n" uu____342))
end
| uu____343 -> begin
()
end));
((e), (lc), (g));
)
end))))))


let comp_check_expected_typ : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.lcomp  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env e lc -> (

let uu____359 = (FStar_TypeChecker_Env.expected_typ env)
in (match (uu____359) with
| None -> begin
((e), (lc), (FStar_TypeChecker_Rel.trivial_guard))
end
| Some (t) -> begin
(

let uu____365 = (FStar_TypeChecker_Util.maybe_coerce_bool_to_type env e lc t)
in (match (uu____365) with
| (e, lc) -> begin
(FStar_TypeChecker_Util.weaken_result_typ env e lc t)
end))
end)))


let check_expected_effect : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.comp Prims.option  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.comp)  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.comp * FStar_TypeChecker_Env.guard_t) = (fun env copt uu____387 -> (match (uu____387) with
| (e, c) -> begin
(

let expected_c_opt = (match (copt) with
| Some (uu____402) -> begin
copt
end
| None -> begin
(

let uu____403 = (((FStar_Options.ml_ish ()) && (FStar_Ident.lid_equals FStar_Syntax_Const.effect_ALL_lid (FStar_Syntax_Util.comp_effect_name c))) || (((FStar_Options.ml_ish ()) && env.FStar_TypeChecker_Env.lax) && (

let uu____404 = (FStar_Syntax_Util.is_pure_or_ghost_comp c)
in (not (uu____404)))))
in (match (uu____403) with
| true -> begin
(

let uu____406 = (FStar_Syntax_Util.ml_comp (FStar_Syntax_Util.comp_result c) e.FStar_Syntax_Syntax.pos)
in Some (uu____406))
end
| uu____407 -> begin
(

let uu____408 = (FStar_Syntax_Util.is_tot_or_gtot_comp c)
in (match (uu____408) with
| true -> begin
None
end
| uu____410 -> begin
(

let uu____411 = (FStar_Syntax_Util.is_pure_comp c)
in (match (uu____411) with
| true -> begin
(

let uu____413 = (FStar_Syntax_Syntax.mk_Total (FStar_Syntax_Util.comp_result c))
in Some (uu____413))
end
| uu____414 -> begin
(

let uu____415 = (FStar_Syntax_Util.is_pure_or_ghost_comp c)
in (match (uu____415) with
| true -> begin
(

let uu____417 = (FStar_Syntax_Syntax.mk_GTotal (FStar_Syntax_Util.comp_result c))
in Some (uu____417))
end
| uu____418 -> begin
None
end))
end))
end))
end))
end)
in (match (expected_c_opt) with
| None -> begin
(

let uu____422 = (norm_c env c)
in ((e), (uu____422), (FStar_TypeChecker_Rel.trivial_guard)))
end
| Some (expected_c) -> begin
((

let uu____425 = (FStar_TypeChecker_Env.debug env FStar_Options.Low)
in (match (uu____425) with
| true -> begin
(

let uu____426 = (FStar_Syntax_Print.term_to_string e)
in (

let uu____427 = (FStar_Syntax_Print.comp_to_string c)
in (

let uu____428 = (FStar_Syntax_Print.comp_to_string expected_c)
in (FStar_Util.print3 "\n\n(%s) About to check\n\t%s\nagainst expected effect\n\t%s\n" uu____426 uu____427 uu____428))))
end
| uu____429 -> begin
()
end));
(

let c = (norm_c env c)
in ((

let uu____432 = (FStar_TypeChecker_Env.debug env FStar_Options.Low)
in (match (uu____432) with
| true -> begin
(

let uu____433 = (FStar_Syntax_Print.term_to_string e)
in (

let uu____434 = (FStar_Syntax_Print.comp_to_string c)
in (

let uu____435 = (FStar_Syntax_Print.comp_to_string expected_c)
in (FStar_Util.print3 "\n\nAfter normalization (%s) About to check\n\t%s\nagainst expected effect\n\t%s\n" uu____433 uu____434 uu____435))))
end
| uu____436 -> begin
()
end));
(

let uu____437 = (FStar_TypeChecker_Util.check_comp env e c expected_c)
in (match (uu____437) with
| (e, uu____445, g) -> begin
(

let g = (

let uu____448 = (FStar_TypeChecker_Env.get_range env)
in (FStar_TypeChecker_Util.label_guard uu____448 "could not prove post-condition" g))
in ((

let uu____450 = (FStar_TypeChecker_Env.debug env FStar_Options.Low)
in (match (uu____450) with
| true -> begin
(

let uu____451 = (FStar_Range.string_of_range e.FStar_Syntax_Syntax.pos)
in (

let uu____452 = (FStar_TypeChecker_Rel.guard_to_string env g)
in (FStar_Util.print2 "(%s) DONE check_expected_effect; guard is: %s\n" uu____451 uu____452)))
end
| uu____453 -> begin
()
end));
(

let e = (FStar_TypeChecker_Util.maybe_lift env e (FStar_Syntax_Util.comp_effect_name c) (FStar_Syntax_Util.comp_effect_name expected_c) (FStar_Syntax_Util.comp_result c))
in ((e), (expected_c), (g)));
))
end));
));
)
end))
end))


let no_logical_guard = (fun env uu____474 -> (match (uu____474) with
| (te, kt, f) -> begin
(

let uu____481 = (FStar_TypeChecker_Rel.guard_form f)
in (match (uu____481) with
| FStar_TypeChecker_Common.Trivial -> begin
((te), (kt), (f))
end
| FStar_TypeChecker_Common.NonTrivial (f) -> begin
(

let uu____486 = (

let uu____487 = (

let uu____490 = (FStar_TypeChecker_Err.unexpected_non_trivial_precondition_on_term env f)
in (

let uu____491 = (FStar_TypeChecker_Env.get_range env)
in ((uu____490), (uu____491))))
in FStar_Errors.Error (uu____487))
in (Prims.raise uu____486))
end))
end))


let print_expected_ty : FStar_TypeChecker_Env.env  ->  Prims.unit = (fun env -> (

let uu____498 = (FStar_TypeChecker_Env.expected_typ env)
in (match (uu____498) with
| None -> begin
(FStar_Util.print_string "Expected type is None")
end
| Some (t) -> begin
(

let uu____501 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print1 "Expected type is %s" uu____501))
end)))


let check_smt_pat = (fun env t bs c -> (

let uu____536 = (FStar_Syntax_Util.is_smt_lemma t)
in (match (uu____536) with
| true -> begin
(match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Comp ({FStar_Syntax_Syntax.comp_univs = uu____537; FStar_Syntax_Syntax.effect_name = uu____538; FStar_Syntax_Syntax.result_typ = uu____539; FStar_Syntax_Syntax.effect_args = (_pre)::(_post)::((pats, uu____543))::[]; FStar_Syntax_Syntax.flags = uu____544}) -> begin
(

let pat_vars = (

let uu____578 = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.Beta)::[]) env pats)
in (FStar_Syntax_Free.names uu____578))
in (

let uu____579 = (FStar_All.pipe_right bs (FStar_Util.find_opt (fun uu____591 -> (match (uu____591) with
| (b, uu____595) -> begin
(

let uu____596 = (FStar_Util.set_mem b pat_vars)
in (not (uu____596)))
end))))
in (match (uu____579) with
| None -> begin
()
end
| Some (x, uu____600) -> begin
(

let uu____603 = (

let uu____604 = (FStar_Syntax_Print.bv_to_string x)
in (FStar_Util.format1 "Pattern misses at least one bound variable: %s" uu____604))
in (FStar_Errors.warn t.FStar_Syntax_Syntax.pos uu____603))
end)))
end
| uu____605 -> begin
(failwith "Impossible")
end)
end
| uu____606 -> begin
()
end)))


let guard_letrecs : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.binders  ->  (FStar_Syntax_Syntax.comp', Prims.unit) FStar_Syntax_Syntax.syntax  ->  (FStar_Syntax_Syntax.lbname * FStar_Syntax_Syntax.typ) Prims.list = (fun env actuals expected_c -> (

let uu____626 = (

let uu____627 = (FStar_TypeChecker_Env.should_verify env)
in (not (uu____627)))
in (match (uu____626) with
| true -> begin
env.FStar_TypeChecker_Env.letrecs
end
| uu____631 -> begin
(match (env.FStar_TypeChecker_Env.letrecs) with
| [] -> begin
[]
end
| letrecs -> begin
(

let r = (FStar_TypeChecker_Env.get_range env)
in (

let env = (

let uu___86_645 = env
in {FStar_TypeChecker_Env.solver = uu___86_645.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___86_645.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___86_645.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___86_645.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___86_645.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___86_645.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___86_645.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___86_645.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___86_645.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = uu___86_645.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___86_645.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___86_645.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = []; FStar_TypeChecker_Env.top_level = uu___86_645.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = uu___86_645.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = uu___86_645.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = uu___86_645.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___86_645.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = uu___86_645.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = uu___86_645.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___86_645.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___86_645.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = uu___86_645.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = uu___86_645.FStar_TypeChecker_Env.qname_and_index})
in (

let precedes = (FStar_TypeChecker_Util.fvar_const env FStar_Syntax_Const.precedes_lid)
in (

let decreases_clause = (fun bs c -> (

let filter_types_and_functions = (fun bs -> (FStar_All.pipe_right bs (FStar_List.collect (fun uu____668 -> (match (uu____668) with
| (b, uu____673) -> begin
(

let t = (

let uu____675 = (FStar_Syntax_Util.unrefine b.FStar_Syntax_Syntax.sort)
in (unfold_whnf env uu____675))
in (match (t.FStar_Syntax_Syntax.n) with
| (FStar_Syntax_Syntax.Tm_type (_)) | (FStar_Syntax_Syntax.Tm_arrow (_)) -> begin
[]
end
| uu____679 -> begin
(

let uu____680 = (FStar_Syntax_Syntax.bv_to_name b)
in (uu____680)::[])
end))
end)))))
in (

let as_lex_list = (fun dec -> (

let uu____685 = (FStar_Syntax_Util.head_and_args dec)
in (match (uu____685) with
| (head, uu____696) -> begin
(match (head.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_fvar (fv) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.lexcons_lid) -> begin
dec
end
| uu____712 -> begin
(mk_lex_list ((dec)::[]))
end)
end)))
in (

let cflags = (FStar_Syntax_Util.comp_flags c)
in (

let uu____715 = (FStar_All.pipe_right cflags (FStar_List.tryFind (fun uu___78_719 -> (match (uu___78_719) with
| FStar_Syntax_Syntax.DECREASES (uu____720) -> begin
true
end
| uu____723 -> begin
false
end))))
in (match (uu____715) with
| Some (FStar_Syntax_Syntax.DECREASES (dec)) -> begin
(as_lex_list dec)
end
| uu____727 -> begin
(

let xs = (FStar_All.pipe_right bs filter_types_and_functions)
in (match (xs) with
| (x)::[] -> begin
x
end
| uu____733 -> begin
(mk_lex_list xs)
end))
end))))))
in (

let previous_dec = (decreases_clause actuals expected_c)
in (

let guard_one_letrec = (fun uu____745 -> (match (uu____745) with
| (l, t) -> begin
(

let uu____754 = (

let uu____755 = (FStar_Syntax_Subst.compress t)
in uu____755.FStar_Syntax_Syntax.n)
in (match (uu____754) with
| FStar_Syntax_Syntax.Tm_arrow (formals, c) -> begin
(

let formals = (FStar_All.pipe_right formals (FStar_List.map (fun uu____788 -> (match (uu____788) with
| (x, imp) -> begin
(

let uu____795 = (FStar_Syntax_Syntax.is_null_bv x)
in (match (uu____795) with
| true -> begin
(

let uu____798 = (

let uu____799 = (

let uu____801 = (FStar_Syntax_Syntax.range_of_bv x)
in Some (uu____801))
in (FStar_Syntax_Syntax.new_bv uu____799 x.FStar_Syntax_Syntax.sort))
in ((uu____798), (imp)))
end
| uu____802 -> begin
((x), (imp))
end))
end))))
in (

let uu____803 = (FStar_Syntax_Subst.open_comp formals c)
in (match (uu____803) with
| (formals, c) -> begin
(

let dec = (decreases_clause formals c)
in (

let precedes = (

let uu____816 = (

let uu____817 = (

let uu____818 = (FStar_Syntax_Syntax.as_arg dec)
in (

let uu____819 = (

let uu____821 = (FStar_Syntax_Syntax.as_arg previous_dec)
in (uu____821)::[])
in (uu____818)::uu____819))
in (FStar_Syntax_Syntax.mk_Tm_app precedes uu____817))
in (uu____816 None r))
in (

let uu____826 = (FStar_Util.prefix formals)
in (match (uu____826) with
| (bs, (last, imp)) -> begin
(

let last = (

let uu___87_852 = last
in (

let uu____853 = (FStar_Syntax_Util.refine last precedes)
in {FStar_Syntax_Syntax.ppname = uu___87_852.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___87_852.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = uu____853}))
in (

let refined_formals = (FStar_List.append bs ((((last), (imp)))::[]))
in (

let t' = (FStar_Syntax_Util.arrow refined_formals c)
in ((

let uu____870 = (FStar_TypeChecker_Env.debug env FStar_Options.Low)
in (match (uu____870) with
| true -> begin
(

let uu____871 = (FStar_Syntax_Print.lbname_to_string l)
in (

let uu____872 = (FStar_Syntax_Print.term_to_string t)
in (

let uu____873 = (FStar_Syntax_Print.term_to_string t')
in (FStar_Util.print3 "Refined let rec %s\n\tfrom type %s\n\tto type %s\n" uu____871 uu____872 uu____873))))
end
| uu____874 -> begin
()
end));
((l), (t'));
))))
end))))
end)))
end
| uu____877 -> begin
(Prims.raise (FStar_Errors.Error ((("Annotated type of \'let rec\' must be an arrow"), (t.FStar_Syntax_Syntax.pos)))))
end))
end))
in (FStar_All.pipe_right letrecs (FStar_List.map guard_one_letrec))))))))
end)
end)))


let rec tc_term : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env e -> (tc_maybe_toplevel_term (

let uu___88_1141 = env
in {FStar_TypeChecker_Env.solver = uu___88_1141.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___88_1141.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___88_1141.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___88_1141.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___88_1141.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___88_1141.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___88_1141.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___88_1141.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___88_1141.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = uu___88_1141.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___88_1141.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___88_1141.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = uu___88_1141.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = false; FStar_TypeChecker_Env.check_uvars = uu___88_1141.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = uu___88_1141.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = uu___88_1141.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___88_1141.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = uu___88_1141.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = uu___88_1141.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___88_1141.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___88_1141.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = uu___88_1141.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = uu___88_1141.FStar_TypeChecker_Env.qname_and_index}) e))
and tc_maybe_toplevel_term : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env e -> (

let env = (match ((e.FStar_Syntax_Syntax.pos = FStar_Range.dummyRange)) with
| true -> begin
env
end
| uu____1148 -> begin
(FStar_TypeChecker_Env.set_range env e.FStar_Syntax_Syntax.pos)
end)
in ((

let uu____1150 = (FStar_TypeChecker_Env.debug env FStar_Options.Low)
in (match (uu____1150) with
| true -> begin
(

let uu____1151 = (

let uu____1152 = (FStar_TypeChecker_Env.get_range env)
in (FStar_All.pipe_left FStar_Range.string_of_range uu____1152))
in (

let uu____1153 = (FStar_Syntax_Print.tag_of_term e)
in (FStar_Util.print2 "%s (%s)\n" uu____1151 uu____1153)))
end
| uu____1154 -> begin
()
end));
(

let top = (FStar_Syntax_Subst.compress e)
in (match (top.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_delayed (uu____1159) -> begin
(failwith "Impossible")
end
| (FStar_Syntax_Syntax.Tm_uinst (_)) | (FStar_Syntax_Syntax.Tm_uvar (_)) | (FStar_Syntax_Syntax.Tm_bvar (_)) | (FStar_Syntax_Syntax.Tm_name (_)) | (FStar_Syntax_Syntax.Tm_fvar (_)) | (FStar_Syntax_Syntax.Tm_constant (_)) | (FStar_Syntax_Syntax.Tm_abs (_)) | (FStar_Syntax_Syntax.Tm_arrow (_)) | (FStar_Syntax_Syntax.Tm_refine (_)) | (FStar_Syntax_Syntax.Tm_type (_)) | (FStar_Syntax_Syntax.Tm_unknown) -> begin
(tc_value env e)
end
| FStar_Syntax_Syntax.Tm_meta (e, FStar_Syntax_Syntax.Meta_desugared (FStar_Syntax_Syntax.Meta_smt_pat)) -> begin
(

let uu____1198 = (tc_tot_or_gtot_term env e)
in (match (uu____1198) with
| (e, c, g) -> begin
(

let g = (

let uu___89_1209 = g
in {FStar_TypeChecker_Env.guard_f = FStar_TypeChecker_Common.Trivial; FStar_TypeChecker_Env.deferred = uu___89_1209.FStar_TypeChecker_Env.deferred; FStar_TypeChecker_Env.univ_ineqs = uu___89_1209.FStar_TypeChecker_Env.univ_ineqs; FStar_TypeChecker_Env.implicits = uu___89_1209.FStar_TypeChecker_Env.implicits})
in ((e), (c), (g)))
end))
end
| FStar_Syntax_Syntax.Tm_meta (e, FStar_Syntax_Syntax.Meta_pattern (pats)) -> begin
(

let uu____1222 = (FStar_Syntax_Util.type_u ())
in (match (uu____1222) with
| (t, u) -> begin
(

let uu____1230 = (tc_check_tot_or_gtot_term env e t)
in (match (uu____1230) with
| (e, c, g) -> begin
(

let uu____1240 = (

let uu____1249 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (uu____1249) with
| (env, uu____1262) -> begin
(tc_pats env pats)
end))
in (match (uu____1240) with
| (pats, g') -> begin
(

let g' = (

let uu___90_1283 = g'
in {FStar_TypeChecker_Env.guard_f = FStar_TypeChecker_Common.Trivial; FStar_TypeChecker_Env.deferred = uu___90_1283.FStar_TypeChecker_Env.deferred; FStar_TypeChecker_Env.univ_ineqs = uu___90_1283.FStar_TypeChecker_Env.univ_ineqs; FStar_TypeChecker_Env.implicits = uu___90_1283.FStar_TypeChecker_Env.implicits})
in (

let uu____1284 = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_meta (((e), (FStar_Syntax_Syntax.Meta_pattern (pats)))))) (Some (t.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in (

let uu____1295 = (FStar_TypeChecker_Rel.conj_guard g g')
in ((uu____1284), (c), (uu____1295)))))
end))
end))
end))
end
| FStar_Syntax_Syntax.Tm_meta (e, FStar_Syntax_Syntax.Meta_desugared (FStar_Syntax_Syntax.Sequence)) -> begin
(

let uu____1303 = (

let uu____1304 = (FStar_Syntax_Subst.compress e)
in uu____1304.FStar_Syntax_Syntax.n)
in (match (uu____1303) with
| FStar_Syntax_Syntax.Tm_let ((uu____1310, ({FStar_Syntax_Syntax.lbname = x; FStar_Syntax_Syntax.lbunivs = uu____1312; FStar_Syntax_Syntax.lbtyp = uu____1313; FStar_Syntax_Syntax.lbeff = uu____1314; FStar_Syntax_Syntax.lbdef = e1})::[]), e2) -> begin
(

let uu____1332 = (

let uu____1336 = (FStar_TypeChecker_Env.set_expected_typ env FStar_TypeChecker_Common.t_unit)
in (tc_term uu____1336 e1))
in (match (uu____1332) with
| (e1, c1, g1) -> begin
(

let uu____1343 = (tc_term env e2)
in (match (uu____1343) with
| (e2, c2, g2) -> begin
(

let c = (FStar_TypeChecker_Util.bind e1.FStar_Syntax_Syntax.pos env (Some (e1)) c1 ((None), (c2)))
in (

let e1 = (FStar_TypeChecker_Util.maybe_lift env e1 c1.FStar_Syntax_Syntax.eff_name c.FStar_Syntax_Syntax.eff_name c1.FStar_Syntax_Syntax.res_typ)
in (

let e2 = (FStar_TypeChecker_Util.maybe_lift env e2 c2.FStar_Syntax_Syntax.eff_name c.FStar_Syntax_Syntax.eff_name c2.FStar_Syntax_Syntax.res_typ)
in (

let e = (

let uu____1360 = (

let uu____1363 = (

let uu____1364 = (

let uu____1372 = (

let uu____1376 = (

let uu____1378 = (FStar_Syntax_Syntax.mk_lb ((x), ([]), (c1.FStar_Syntax_Syntax.eff_name), (FStar_TypeChecker_Common.t_unit), (e1)))
in (uu____1378)::[])
in ((false), (uu____1376)))
in ((uu____1372), (e2)))
in FStar_Syntax_Syntax.Tm_let (uu____1364))
in (FStar_Syntax_Syntax.mk uu____1363))
in (uu____1360 (Some (c.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) e.FStar_Syntax_Syntax.pos))
in (

let e = (FStar_TypeChecker_Util.maybe_monadic env e c.FStar_Syntax_Syntax.eff_name c.FStar_Syntax_Syntax.res_typ)
in (

let e = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_meta (((e), (FStar_Syntax_Syntax.Meta_desugared (FStar_Syntax_Syntax.Sequence)))))) (Some (c.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in (

let uu____1408 = (FStar_TypeChecker_Rel.conj_guard g1 g2)
in ((e), (c), (uu____1408)))))))))
end))
end))
end
| uu____1411 -> begin
(

let uu____1412 = (tc_term env e)
in (match (uu____1412) with
| (e, c, g) -> begin
(

let e = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_meta (((e), (FStar_Syntax_Syntax.Meta_desugared (FStar_Syntax_Syntax.Sequence)))))) (Some (c.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in ((e), (c), (g)))
end))
end))
end
| FStar_Syntax_Syntax.Tm_meta (e, FStar_Syntax_Syntax.Meta_monadic (uu____1436)) -> begin
(tc_term env e)
end
| FStar_Syntax_Syntax.Tm_meta (e, m) -> begin
(

let uu____1451 = (tc_term env e)
in (match (uu____1451) with
| (e, c, g) -> begin
(

let e = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_meta (((e), (m))))) (Some (c.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in ((e), (c), (g)))
end))
end
| FStar_Syntax_Syntax.Tm_ascribed (e, FStar_Util.Inr (expected_c), uu____1476) -> begin
(

let uu____1495 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (uu____1495) with
| (env0, uu____1503) -> begin
(

let uu____1506 = (tc_comp env0 expected_c)
in (match (uu____1506) with
| (expected_c, uu____1514, g) -> begin
(

let t_res = (FStar_Syntax_Util.comp_result expected_c)
in (

let uu____1519 = (

let uu____1523 = (FStar_TypeChecker_Env.set_expected_typ env0 t_res)
in (tc_term uu____1523 e))
in (match (uu____1519) with
| (e, c', g') -> begin
(

let uu____1530 = (

let uu____1534 = (

let uu____1537 = (c'.FStar_Syntax_Syntax.comp ())
in ((e), (uu____1537)))
in (check_expected_effect env0 (Some (expected_c)) uu____1534))
in (match (uu____1530) with
| (e, expected_c, g'') -> begin
(

let e = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_ascribed (((e), (FStar_Util.Inl (t_res)), (Some ((FStar_Syntax_Util.comp_effect_name expected_c))))))) (Some (t_res.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in (

let lc = (FStar_Syntax_Util.lcomp_of_comp expected_c)
in (

let f = (

let uu____1572 = (FStar_TypeChecker_Rel.conj_guard g' g'')
in (FStar_TypeChecker_Rel.conj_guard g uu____1572))
in (

let uu____1573 = (comp_check_expected_typ env e lc)
in (match (uu____1573) with
| (e, c, f2) -> begin
(

let uu____1583 = (FStar_TypeChecker_Rel.conj_guard f f2)
in ((e), (c), (uu____1583)))
end)))))
end))
end)))
end))
end))
end
| FStar_Syntax_Syntax.Tm_ascribed (e, FStar_Util.Inl (t), uu____1586) -> begin
(

let uu____1605 = (FStar_Syntax_Util.type_u ())
in (match (uu____1605) with
| (k, u) -> begin
(

let uu____1613 = (tc_check_tot_or_gtot_term env t k)
in (match (uu____1613) with
| (t, uu____1621, f) -> begin
(

let uu____1623 = (

let uu____1627 = (FStar_TypeChecker_Env.set_expected_typ env t)
in (tc_term uu____1627 e))
in (match (uu____1623) with
| (e, c, g) -> begin
(

let uu____1634 = (

let uu____1637 = (FStar_TypeChecker_Env.set_range env t.FStar_Syntax_Syntax.pos)
in (FStar_TypeChecker_Util.strengthen_precondition (Some ((fun uu____1640 -> FStar_TypeChecker_Err.ill_kinded_type))) uu____1637 e c f))
in (match (uu____1634) with
| (c, f) -> begin
(

let uu____1646 = (

let uu____1650 = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_ascribed (((e), (FStar_Util.Inl (t)), (Some (c.FStar_Syntax_Syntax.eff_name)))))) (Some (t.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in (comp_check_expected_typ env uu____1650 c))
in (match (uu____1646) with
| (e, c, f2) -> begin
(

let uu____1672 = (

let uu____1673 = (FStar_TypeChecker_Rel.conj_guard g f2)
in (FStar_TypeChecker_Rel.conj_guard f uu____1673))
in ((e), (c), (uu____1672)))
end))
end))
end))
end))
end))
end
| (FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify); FStar_Syntax_Syntax.tk = _; FStar_Syntax_Syntax.pos = _; FStar_Syntax_Syntax.vars = _}, (a)::(hd)::rest)) | (FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reflect (_)); FStar_Syntax_Syntax.tk = _; FStar_Syntax_Syntax.pos = _; FStar_Syntax_Syntax.vars = _}, (a)::(hd)::rest)) -> begin
(

let rest = (hd)::rest
in (

let uu____1750 = (FStar_Syntax_Util.head_and_args top)
in (match (uu____1750) with
| (unary_op, uu____1764) -> begin
(

let head = (

let uu____1782 = (FStar_Range.union_ranges unary_op.FStar_Syntax_Syntax.pos (Prims.fst a).FStar_Syntax_Syntax.pos)
in ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (((unary_op), ((a)::[]))))) None uu____1782))
in (

let t = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (((head), (rest))))) None top.FStar_Syntax_Syntax.pos)
in (tc_term env t)))
end)))
end
| FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify); FStar_Syntax_Syntax.tk = uu____1826; FStar_Syntax_Syntax.pos = uu____1827; FStar_Syntax_Syntax.vars = uu____1828}, ((e, aqual))::[]) -> begin
((match ((FStar_Option.isSome aqual)) with
| true -> begin
(FStar_Errors.warn e.FStar_Syntax_Syntax.pos "Qualifier on argument to reify is irrelevant and will be ignored")
end
| uu____1853 -> begin
()
end);
(

let uu____1854 = (

let uu____1858 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (uu____1858) with
| (env0, uu____1866) -> begin
(tc_term env0 e)
end))
in (match (uu____1854) with
| (e, c, g) -> begin
(

let uu____1875 = (FStar_Syntax_Util.head_and_args top)
in (match (uu____1875) with
| (reify_op, uu____1889) -> begin
(

let u_c = (

let uu____1905 = (tc_term env c.FStar_Syntax_Syntax.res_typ)
in (match (uu____1905) with
| (uu____1909, c', uu____1911) -> begin
(

let uu____1912 = (

let uu____1913 = (FStar_Syntax_Subst.compress c'.FStar_Syntax_Syntax.res_typ)
in uu____1913.FStar_Syntax_Syntax.n)
in (match (uu____1912) with
| FStar_Syntax_Syntax.Tm_type (u) -> begin
u
end
| uu____1917 -> begin
(

let uu____1918 = (FStar_Syntax_Util.type_u ())
in (match (uu____1918) with
| (t, u) -> begin
(

let g_opt = (FStar_TypeChecker_Rel.try_teq env c'.FStar_Syntax_Syntax.res_typ t)
in ((match (g_opt) with
| Some (g') -> begin
(FStar_TypeChecker_Rel.force_trivial_guard env g')
end
| None -> begin
(

let uu____1927 = (

let uu____1928 = (FStar_Syntax_Print.lcomp_to_string c')
in (

let uu____1929 = (FStar_Syntax_Print.term_to_string c.FStar_Syntax_Syntax.res_typ)
in (

let uu____1930 = (FStar_Syntax_Print.term_to_string c'.FStar_Syntax_Syntax.res_typ)
in (FStar_Util.format3 "Unexpected result type of computation. The computation type %s of the term %s should have type Type n for some level n but has type %s" uu____1928 uu____1929 uu____1930))))
in (failwith uu____1927))
end);
u;
))
end))
end))
end))
in (

let repr = (

let uu____1932 = (c.FStar_Syntax_Syntax.comp ())
in (FStar_TypeChecker_Env.reify_comp env uu____1932 u_c))
in (

let e = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (((reify_op), ((((e), (aqual)))::[]))))) (Some (repr.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in (

let c = (

let uu____1954 = (FStar_Syntax_Syntax.mk_Total repr)
in (FStar_All.pipe_right uu____1954 FStar_Syntax_Util.lcomp_of_comp))
in (

let uu____1955 = (comp_check_expected_typ env e c)
in (match (uu____1955) with
| (e, c, g') -> begin
(

let uu____1965 = (FStar_TypeChecker_Rel.conj_guard g g')
in ((e), (c), (uu____1965)))
end))))))
end))
end));
)
end
| FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reflect (l)); FStar_Syntax_Syntax.tk = uu____1967; FStar_Syntax_Syntax.pos = uu____1968; FStar_Syntax_Syntax.vars = uu____1969}, ((e, aqual))::[]) -> begin
((match ((FStar_Option.isSome aqual)) with
| true -> begin
(FStar_Errors.warn e.FStar_Syntax_Syntax.pos "Qualifier on argument to reflect is irrelevant and will be ignored")
end
| uu____1994 -> begin
()
end);
(

let no_reflect = (fun uu____2001 -> (

let uu____2002 = (

let uu____2003 = (

let uu____2006 = (FStar_Util.format1 "Effect %s cannot be reified" l.FStar_Ident.str)
in ((uu____2006), (e.FStar_Syntax_Syntax.pos)))
in FStar_Errors.Error (uu____2003))
in (Prims.raise uu____2002)))
in (

let uu____2010 = (FStar_Syntax_Util.head_and_args top)
in (match (uu____2010) with
| (reflect_op, uu____2024) -> begin
(

let uu____2039 = (FStar_TypeChecker_Env.effect_decl_opt env l)
in (match (uu____2039) with
| None -> begin
(no_reflect ())
end
| Some (ed) -> begin
(

let uu____2045 = (

let uu____2046 = (FStar_All.pipe_right ed.FStar_Syntax_Syntax.qualifiers FStar_Syntax_Syntax.contains_reflectable)
in (not (uu____2046)))
in (match (uu____2045) with
| true -> begin
(no_reflect ())
end
| uu____2051 -> begin
(

let uu____2052 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (uu____2052) with
| (env_no_ex, topt) -> begin
(

let uu____2063 = (

let u = (FStar_TypeChecker_Env.new_u_univ ())
in (

let repr = (FStar_TypeChecker_Env.inst_effect_fun_with ((u)::[]) env ed (([]), (ed.FStar_Syntax_Syntax.repr)))
in (

let t = (

let uu____2078 = (

let uu____2081 = (

let uu____2082 = (

let uu____2092 = (

let uu____2094 = (FStar_Syntax_Syntax.as_arg FStar_Syntax_Syntax.tun)
in (

let uu____2095 = (

let uu____2097 = (FStar_Syntax_Syntax.as_arg FStar_Syntax_Syntax.tun)
in (uu____2097)::[])
in (uu____2094)::uu____2095))
in ((repr), (uu____2092)))
in FStar_Syntax_Syntax.Tm_app (uu____2082))
in (FStar_Syntax_Syntax.mk uu____2081))
in (uu____2078 None top.FStar_Syntax_Syntax.pos))
in (

let uu____2107 = (

let uu____2111 = (

let uu____2112 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (FStar_All.pipe_right uu____2112 Prims.fst))
in (tc_tot_or_gtot_term uu____2111 t))
in (match (uu____2107) with
| (t, uu____2129, g) -> begin
(

let uu____2131 = (

let uu____2132 = (FStar_Syntax_Subst.compress t)
in uu____2132.FStar_Syntax_Syntax.n)
in (match (uu____2131) with
| FStar_Syntax_Syntax.Tm_app (uu____2143, ((res, uu____2145))::((wp, uu____2147))::[]) -> begin
((t), (res), (wp), (g))
end
| uu____2181 -> begin
(failwith "Impossible")
end))
end)))))
in (match (uu____2063) with
| (expected_repr_typ, res_typ, wp, g0) -> begin
(

let uu____2205 = (

let uu____2208 = (tc_tot_or_gtot_term env_no_ex e)
in (match (uu____2208) with
| (e, c, g) -> begin
((

let uu____2218 = (

let uu____2219 = (FStar_Syntax_Util.is_total_lcomp c)
in (FStar_All.pipe_left Prims.op_Negation uu____2219))
in (match (uu____2218) with
| true -> begin
(FStar_TypeChecker_Err.add_errors env (((("Expected Tot, got a GTot computation"), (e.FStar_Syntax_Syntax.pos)))::[]))
end
| uu____2224 -> begin
()
end));
(

let uu____2225 = (FStar_TypeChecker_Rel.try_teq env_no_ex c.FStar_Syntax_Syntax.res_typ expected_repr_typ)
in (match (uu____2225) with
| None -> begin
((

let uu____2230 = (

let uu____2234 = (

let uu____2237 = (

let uu____2238 = (FStar_Syntax_Print.term_to_string ed.FStar_Syntax_Syntax.repr)
in (

let uu____2239 = (FStar_Syntax_Print.term_to_string c.FStar_Syntax_Syntax.res_typ)
in (FStar_Util.format2 "Expected an instance of %s; got %s" uu____2238 uu____2239)))
in ((uu____2237), (e.FStar_Syntax_Syntax.pos)))
in (uu____2234)::[])
in (FStar_TypeChecker_Err.add_errors env uu____2230));
(

let uu____2244 = (FStar_TypeChecker_Rel.conj_guard g g0)
in ((e), (uu____2244)));
)
end
| Some (g') -> begin
(

let uu____2246 = (

let uu____2247 = (FStar_TypeChecker_Rel.conj_guard g g0)
in (FStar_TypeChecker_Rel.conj_guard g' uu____2247))
in ((e), (uu____2246)))
end));
)
end))
in (match (uu____2205) with
| (e, g) -> begin
(

let c = (

let uu____2254 = (

let uu____2255 = (

let uu____2256 = (

let uu____2257 = (env.FStar_TypeChecker_Env.universe_of env res_typ)
in (uu____2257)::[])
in (

let uu____2258 = (

let uu____2264 = (FStar_Syntax_Syntax.as_arg wp)
in (uu____2264)::[])
in {FStar_Syntax_Syntax.comp_univs = uu____2256; FStar_Syntax_Syntax.effect_name = ed.FStar_Syntax_Syntax.mname; FStar_Syntax_Syntax.result_typ = res_typ; FStar_Syntax_Syntax.effect_args = uu____2258; FStar_Syntax_Syntax.flags = []}))
in (FStar_Syntax_Syntax.mk_Comp uu____2255))
in (FStar_All.pipe_right uu____2254 FStar_Syntax_Util.lcomp_of_comp))
in (

let e = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (((reflect_op), ((((e), (aqual)))::[]))))) (Some (res_typ.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in (

let uu____2285 = (comp_check_expected_typ env e c)
in (match (uu____2285) with
| (e, c, g') -> begin
(

let uu____2295 = (FStar_TypeChecker_Rel.conj_guard g' g)
in ((e), (c), (uu____2295)))
end))))
end))
end))
end))
end))
end))
end)));
)
end
| FStar_Syntax_Syntax.Tm_app (head, args) -> begin
(

let env0 = env
in (

let env = (

let uu____2314 = (

let uu____2315 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (FStar_All.pipe_right uu____2315 Prims.fst))
in (FStar_All.pipe_right uu____2314 instantiate_both))
in ((

let uu____2324 = (FStar_TypeChecker_Env.debug env FStar_Options.High)
in (match (uu____2324) with
| true -> begin
(

let uu____2325 = (FStar_Range.string_of_range top.FStar_Syntax_Syntax.pos)
in (

let uu____2326 = (FStar_Syntax_Print.term_to_string top)
in (FStar_Util.print2 "(%s) Checking app %s\n" uu____2325 uu____2326)))
end
| uu____2327 -> begin
()
end));
(

let uu____2328 = (tc_term (no_inst env) head)
in (match (uu____2328) with
| (head, chead, g_head) -> begin
(

let uu____2338 = (

let uu____2342 = ((not (env.FStar_TypeChecker_Env.lax)) && (FStar_TypeChecker_Util.short_circuit_head head))
in (match (uu____2342) with
| true -> begin
(

let uu____2346 = (FStar_TypeChecker_Env.expected_typ env0)
in (check_short_circuit_args env head chead g_head args uu____2346))
end
| uu____2348 -> begin
(

let uu____2349 = (FStar_TypeChecker_Env.expected_typ env0)
in (check_application_args env head chead g_head args uu____2349))
end))
in (match (uu____2338) with
| (e, c, g) -> begin
((

let uu____2358 = (FStar_TypeChecker_Env.debug env FStar_Options.Extreme)
in (match (uu____2358) with
| true -> begin
(

let uu____2359 = (FStar_TypeChecker_Rel.print_pending_implicits g)
in (FStar_Util.print1 "Introduced {%s} implicits in application\n" uu____2359))
end
| uu____2360 -> begin
()
end));
(

let c = (

let uu____2362 = (((FStar_TypeChecker_Env.should_verify env) && (

let uu____2363 = (FStar_Syntax_Util.is_lcomp_partial_return c)
in (not (uu____2363)))) && (FStar_Syntax_Util.is_pure_or_ghost_lcomp c))
in (match (uu____2362) with
| true -> begin
(FStar_TypeChecker_Util.maybe_assume_result_eq_pure_term env e c)
end
| uu____2364 -> begin
c
end))
in (

let uu____2365 = (comp_check_expected_typ env0 e c)
in (match (uu____2365) with
| (e, c, g') -> begin
(

let gimp = (

let uu____2376 = (

let uu____2377 = (FStar_Syntax_Subst.compress head)
in uu____2377.FStar_Syntax_Syntax.n)
in (match (uu____2376) with
| FStar_Syntax_Syntax.Tm_uvar (u, uu____2381) -> begin
(

let imp = (("head of application is a uvar"), (env0), (u), (e), (c.FStar_Syntax_Syntax.res_typ), (head.FStar_Syntax_Syntax.pos))
in (

let uu___91_2413 = FStar_TypeChecker_Rel.trivial_guard
in {FStar_TypeChecker_Env.guard_f = uu___91_2413.FStar_TypeChecker_Env.guard_f; FStar_TypeChecker_Env.deferred = uu___91_2413.FStar_TypeChecker_Env.deferred; FStar_TypeChecker_Env.univ_ineqs = uu___91_2413.FStar_TypeChecker_Env.univ_ineqs; FStar_TypeChecker_Env.implicits = (imp)::[]}))
end
| uu____2438 -> begin
FStar_TypeChecker_Rel.trivial_guard
end))
in (

let gres = (

let uu____2440 = (FStar_TypeChecker_Rel.conj_guard g' gimp)
in (FStar_TypeChecker_Rel.conj_guard g uu____2440))
in ((

let uu____2442 = (FStar_TypeChecker_Env.debug env FStar_Options.Extreme)
in (match (uu____2442) with
| true -> begin
(

let uu____2443 = (FStar_Syntax_Print.term_to_string e)
in (

let uu____2444 = (FStar_TypeChecker_Rel.guard_to_string env gres)
in (FStar_Util.print2 "Guard from application node %s is %s\n" uu____2443 uu____2444)))
end
| uu____2445 -> begin
()
end));
((e), (c), (gres));
)))
end)));
)
end))
end));
)))
end
| FStar_Syntax_Syntax.Tm_match (e1, eqns) -> begin
(

let uu____2474 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (uu____2474) with
| (env1, topt) -> begin
(

let env1 = (instantiate_both env1)
in (

let uu____2486 = (tc_term env1 e1)
in (match (uu____2486) with
| (e1, c1, g1) -> begin
(

let uu____2496 = (match (topt) with
| Some (t) -> begin
((env), (t))
end
| None -> begin
(

let uu____2502 = (FStar_Syntax_Util.type_u ())
in (match (uu____2502) with
| (k, uu____2508) -> begin
(

let res_t = (FStar_TypeChecker_Util.new_uvar env k)
in (

let uu____2510 = (FStar_TypeChecker_Env.set_expected_typ env res_t)
in ((uu____2510), (res_t))))
end))
end)
in (match (uu____2496) with
| (env_branches, res_t) -> begin
((

let uu____2517 = (FStar_TypeChecker_Env.debug env FStar_Options.Extreme)
in (match (uu____2517) with
| true -> begin
(

let uu____2518 = (FStar_Syntax_Print.term_to_string res_t)
in (FStar_Util.print1 "Tm_match: expected type of branches is %s\n" uu____2518))
end
| uu____2519 -> begin
()
end));
(

let guard_x = (FStar_Syntax_Syntax.new_bv (Some (e1.FStar_Syntax_Syntax.pos)) c1.FStar_Syntax_Syntax.res_typ)
in (

let t_eqns = (FStar_All.pipe_right eqns (FStar_List.map (tc_eqn guard_x env_branches)))
in (

let uu____2569 = (

let uu____2572 = (FStar_List.fold_right (fun uu____2591 uu____2592 -> (match (((uu____2591), (uu____2592))) with
| ((uu____2624, f, c, g), (caccum, gaccum)) -> begin
(

let uu____2657 = (FStar_TypeChecker_Rel.conj_guard g gaccum)
in (((((f), (c)))::caccum), (uu____2657)))
end)) t_eqns (([]), (FStar_TypeChecker_Rel.trivial_guard)))
in (match (uu____2572) with
| (cases, g) -> begin
(

let uu____2678 = (FStar_TypeChecker_Util.bind_cases env res_t cases)
in ((uu____2678), (g)))
end))
in (match (uu____2569) with
| (c_branches, g_branches) -> begin
(

let cres = (FStar_TypeChecker_Util.bind e1.FStar_Syntax_Syntax.pos env (Some (e1)) c1 ((Some (guard_x)), (c_branches)))
in (

let e = (

let mk_match = (fun scrutinee -> (

let branches = (FStar_All.pipe_right t_eqns (FStar_List.map (fun uu____2731 -> (match (uu____2731) with
| ((pat, wopt, br), uu____2747, lc, uu____2749) -> begin
(

let uu____2756 = (FStar_TypeChecker_Util.maybe_lift env br lc.FStar_Syntax_Syntax.eff_name cres.FStar_Syntax_Syntax.eff_name lc.FStar_Syntax_Syntax.res_typ)
in ((pat), (wopt), (uu____2756)))
end))))
in (

let e = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_match (((scrutinee), (branches))))) (Some (cres.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in (

let e = (FStar_TypeChecker_Util.maybe_monadic env e cres.FStar_Syntax_Syntax.eff_name cres.FStar_Syntax_Syntax.res_typ)
in ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_ascribed (((e), (FStar_Util.Inl (cres.FStar_Syntax_Syntax.res_typ)), (Some (cres.FStar_Syntax_Syntax.eff_name)))))) None e.FStar_Syntax_Syntax.pos)))))
in (

let uu____2796 = (FStar_TypeChecker_Util.is_pure_or_ghost_effect env c1.FStar_Syntax_Syntax.eff_name)
in (match (uu____2796) with
| true -> begin
(mk_match e1)
end
| uu____2799 -> begin
(

let e_match = (

let uu____2803 = (FStar_Syntax_Syntax.bv_to_name guard_x)
in (mk_match uu____2803))
in (

let lb = (

let uu____2807 = (FStar_TypeChecker_Env.norm_eff_name env c1.FStar_Syntax_Syntax.eff_name)
in {FStar_Syntax_Syntax.lbname = FStar_Util.Inl (guard_x); FStar_Syntax_Syntax.lbunivs = []; FStar_Syntax_Syntax.lbtyp = c1.FStar_Syntax_Syntax.res_typ; FStar_Syntax_Syntax.lbeff = uu____2807; FStar_Syntax_Syntax.lbdef = e1})
in (

let e = (

let uu____2811 = (

let uu____2814 = (

let uu____2815 = (

let uu____2823 = (

let uu____2824 = (

let uu____2825 = (FStar_Syntax_Syntax.mk_binder guard_x)
in (uu____2825)::[])
in (FStar_Syntax_Subst.close uu____2824 e_match))
in ((((false), ((lb)::[]))), (uu____2823)))
in FStar_Syntax_Syntax.Tm_let (uu____2815))
in (FStar_Syntax_Syntax.mk uu____2814))
in (uu____2811 (Some (cres.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos))
in (FStar_TypeChecker_Util.maybe_monadic env e cres.FStar_Syntax_Syntax.eff_name cres.FStar_Syntax_Syntax.res_typ))))
end)))
in ((

let uu____2839 = (FStar_TypeChecker_Env.debug env FStar_Options.Extreme)
in (match (uu____2839) with
| true -> begin
(

let uu____2840 = (FStar_Range.string_of_range top.FStar_Syntax_Syntax.pos)
in (

let uu____2841 = (

let uu____2842 = (cres.FStar_Syntax_Syntax.comp ())
in (FStar_All.pipe_left FStar_Syntax_Print.comp_to_string uu____2842))
in (FStar_Util.print2 "(%s) comp type = %s\n" uu____2840 uu____2841)))
end
| uu____2843 -> begin
()
end));
(

let uu____2844 = (FStar_TypeChecker_Rel.conj_guard g1 g_branches)
in ((e), (cres), (uu____2844)));
)))
end))));
)
end))
end)))
end))
end
| FStar_Syntax_Syntax.Tm_let ((false, ({FStar_Syntax_Syntax.lbname = FStar_Util.Inr (uu____2847); FStar_Syntax_Syntax.lbunivs = uu____2848; FStar_Syntax_Syntax.lbtyp = uu____2849; FStar_Syntax_Syntax.lbeff = uu____2850; FStar_Syntax_Syntax.lbdef = uu____2851})::[]), uu____2852) -> begin
((

let uu____2867 = (FStar_TypeChecker_Env.debug env FStar_Options.Low)
in (match (uu____2867) with
| true -> begin
(

let uu____2868 = (FStar_Syntax_Print.term_to_string top)
in (FStar_Util.print1 "%s\n" uu____2868))
end
| uu____2869 -> begin
()
end));
(check_top_level_let env top);
)
end
| FStar_Syntax_Syntax.Tm_let ((false, uu____2870), uu____2871) -> begin
(check_inner_let env top)
end
| FStar_Syntax_Syntax.Tm_let ((true, ({FStar_Syntax_Syntax.lbname = FStar_Util.Inr (uu____2881); FStar_Syntax_Syntax.lbunivs = uu____2882; FStar_Syntax_Syntax.lbtyp = uu____2883; FStar_Syntax_Syntax.lbeff = uu____2884; FStar_Syntax_Syntax.lbdef = uu____2885})::uu____2886), uu____2887) -> begin
((

let uu____2903 = (FStar_TypeChecker_Env.debug env FStar_Options.Low)
in (match (uu____2903) with
| true -> begin
(

let uu____2904 = (FStar_Syntax_Print.term_to_string top)
in (FStar_Util.print1 "%s\n" uu____2904))
end
| uu____2905 -> begin
()
end));
(check_top_level_let_rec env top);
)
end
| FStar_Syntax_Syntax.Tm_let ((true, uu____2906), uu____2907) -> begin
(check_inner_let_rec env top)
end));
)))
and tc_value : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env e -> (

let check_instantiated_fvar = (fun env v dc e t -> (

let uu____2951 = (FStar_TypeChecker_Util.maybe_instantiate env e t)
in (match (uu____2951) with
| (e, t, implicits) -> begin
(

let tc = (

let uu____2964 = (FStar_TypeChecker_Env.should_verify env)
in (match (uu____2964) with
| true -> begin
FStar_Util.Inl (t)
end
| uu____2967 -> begin
(

let uu____2968 = (

let uu____2969 = (FStar_Syntax_Syntax.mk_Total t)
in (FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp uu____2969))
in FStar_Util.Inr (uu____2968))
end))
in (

let is_data_ctor = (fun uu___79_2978 -> (match (uu___79_2978) with
| (Some (FStar_Syntax_Syntax.Data_ctor)) | (Some (FStar_Syntax_Syntax.Record_ctor (_))) -> begin
true
end
| uu____2981 -> begin
false
end))
in (

let uu____2983 = ((is_data_ctor dc) && (

let uu____2984 = (FStar_TypeChecker_Env.is_datacon env v.FStar_Syntax_Syntax.v)
in (not (uu____2984))))
in (match (uu____2983) with
| true -> begin
(

let uu____2990 = (

let uu____2991 = (

let uu____2994 = (FStar_Util.format1 "Expected a data constructor; got %s" v.FStar_Syntax_Syntax.v.FStar_Ident.str)
in (

let uu____2997 = (FStar_TypeChecker_Env.get_range env)
in ((uu____2994), (uu____2997))))
in FStar_Errors.Error (uu____2991))
in (Prims.raise uu____2990))
end
| uu____3001 -> begin
(value_check_expected_typ env e tc implicits)
end))))
end)))
in (

let env = (FStar_TypeChecker_Env.set_range env e.FStar_Syntax_Syntax.pos)
in (

let top = (FStar_Syntax_Subst.compress e)
in (match (top.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_bvar (x) -> begin
(

let uu____3008 = (

let uu____3009 = (FStar_Syntax_Print.term_to_string top)
in (FStar_Util.format1 "Impossible: Violation of locally nameless convention: %s" uu____3009))
in (failwith uu____3008))
end
| FStar_Syntax_Syntax.Tm_uvar (u, t1) -> begin
(

let g = (

let uu____3028 = (

let uu____3029 = (FStar_Syntax_Subst.compress t1)
in uu____3029.FStar_Syntax_Syntax.n)
in (match (uu____3028) with
| FStar_Syntax_Syntax.Tm_arrow (uu____3032) -> begin
FStar_TypeChecker_Rel.trivial_guard
end
| uu____3040 -> begin
(

let imp = (("uvar in term"), (env), (u), (top), (t1), (top.FStar_Syntax_Syntax.pos))
in (

let uu___92_3060 = FStar_TypeChecker_Rel.trivial_guard
in {FStar_TypeChecker_Env.guard_f = uu___92_3060.FStar_TypeChecker_Env.guard_f; FStar_TypeChecker_Env.deferred = uu___92_3060.FStar_TypeChecker_Env.deferred; FStar_TypeChecker_Env.univ_ineqs = uu___92_3060.FStar_TypeChecker_Env.univ_ineqs; FStar_TypeChecker_Env.implicits = (imp)::[]}))
end))
in (value_check_expected_typ env e (FStar_Util.Inl (t1)) g))
end
| FStar_Syntax_Syntax.Tm_unknown -> begin
(

let r = (FStar_TypeChecker_Env.get_range env)
in (

let uu____3088 = (

let uu____3095 = (FStar_TypeChecker_Env.expected_typ env)
in (match (uu____3095) with
| None -> begin
(

let uu____3103 = (FStar_Syntax_Util.type_u ())
in (match (uu____3103) with
| (k, u) -> begin
(FStar_TypeChecker_Util.new_implicit_var "type of user-provided implicit term" r env k)
end))
end
| Some (t) -> begin
((t), ([]), (FStar_TypeChecker_Rel.trivial_guard))
end))
in (match (uu____3088) with
| (t, uu____3124, g0) -> begin
(

let uu____3132 = (FStar_TypeChecker_Util.new_implicit_var "user-provided implicit term" r env t)
in (match (uu____3132) with
| (e, uu____3143, g1) -> begin
(

let uu____3151 = (

let uu____3152 = (FStar_Syntax_Syntax.mk_Total t)
in (FStar_All.pipe_right uu____3152 FStar_Syntax_Util.lcomp_of_comp))
in (

let uu____3153 = (FStar_TypeChecker_Rel.conj_guard g0 g1)
in ((e), (uu____3151), (uu____3153))))
end))
end)))
end
| FStar_Syntax_Syntax.Tm_name (x) -> begin
(

let t = (match (env.FStar_TypeChecker_Env.use_bv_sorts) with
| true -> begin
x.FStar_Syntax_Syntax.sort
end
| uu____3160 -> begin
(FStar_TypeChecker_Env.lookup_bv env x)
end)
in (

let e = (FStar_Syntax_Syntax.bv_to_name (

let uu___93_3162 = x
in {FStar_Syntax_Syntax.ppname = uu___93_3162.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___93_3162.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = t}))
in (

let uu____3163 = (FStar_TypeChecker_Util.maybe_instantiate env e t)
in (match (uu____3163) with
| (e, t, implicits) -> begin
(

let tc = (

let uu____3176 = (FStar_TypeChecker_Env.should_verify env)
in (match (uu____3176) with
| true -> begin
FStar_Util.Inl (t)
end
| uu____3179 -> begin
(

let uu____3180 = (

let uu____3181 = (FStar_Syntax_Syntax.mk_Total t)
in (FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp uu____3181))
in FStar_Util.Inr (uu____3180))
end))
in (value_check_expected_typ env e tc implicits))
end))))
end
| FStar_Syntax_Syntax.Tm_uinst ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (fv); FStar_Syntax_Syntax.tk = uu____3187; FStar_Syntax_Syntax.pos = uu____3188; FStar_Syntax_Syntax.vars = uu____3189}, us) -> begin
(

let us = (FStar_List.map (tc_universe env) us)
in (

let uu____3197 = (FStar_TypeChecker_Env.lookup_lid env fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
in (match (uu____3197) with
| (us', t) -> begin
((match (((FStar_List.length us) <> (FStar_List.length us'))) with
| true -> begin
(

let uu____3214 = (

let uu____3215 = (

let uu____3218 = (FStar_TypeChecker_Env.get_range env)
in (("Unexpected number of universe instantiations"), (uu____3218)))
in FStar_Errors.Error (uu____3215))
in (Prims.raise uu____3214))
end
| uu____3219 -> begin
(FStar_List.iter2 (fun u' u -> (match (u') with
| FStar_Syntax_Syntax.U_unif (u'') -> begin
(FStar_Unionfind.change u'' (Some (u)))
end
| uu____3226 -> begin
(failwith "Impossible")
end)) us' us)
end);
(

let fv' = (

let uu___94_3228 = fv
in {FStar_Syntax_Syntax.fv_name = (

let uu___95_3229 = fv.FStar_Syntax_Syntax.fv_name
in {FStar_Syntax_Syntax.v = uu___95_3229.FStar_Syntax_Syntax.v; FStar_Syntax_Syntax.ty = t; FStar_Syntax_Syntax.p = uu___95_3229.FStar_Syntax_Syntax.p}); FStar_Syntax_Syntax.fv_delta = uu___94_3228.FStar_Syntax_Syntax.fv_delta; FStar_Syntax_Syntax.fv_qual = uu___94_3228.FStar_Syntax_Syntax.fv_qual})
in (

let e = (

let uu____3243 = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_fvar (fv'))) (Some (t.FStar_Syntax_Syntax.n)) e.FStar_Syntax_Syntax.pos)
in (FStar_Syntax_Syntax.mk_Tm_uinst uu____3243 us))
in (check_instantiated_fvar env fv'.FStar_Syntax_Syntax.fv_name fv'.FStar_Syntax_Syntax.fv_qual e t)));
)
end)))
end
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(

let uu____3255 = (FStar_TypeChecker_Env.lookup_lid env fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
in (match (uu____3255) with
| (us, t) -> begin
((

let uu____3268 = (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env) (FStar_Options.Other ("Range")))
in (match (uu____3268) with
| true -> begin
(

let uu____3269 = (

let uu____3270 = (FStar_Syntax_Syntax.lid_of_fv fv)
in (FStar_Syntax_Print.lid_to_string uu____3270))
in (

let uu____3271 = (FStar_Range.string_of_range e.FStar_Syntax_Syntax.pos)
in (

let uu____3272 = (

let uu____3273 = (

let uu____3274 = (FStar_Syntax_Syntax.lid_of_fv fv)
in (FStar_Ident.range_of_lid uu____3274))
in (FStar_Range.string_of_range uu____3273))
in (

let uu____3275 = (

let uu____3276 = (

let uu____3277 = (FStar_Syntax_Syntax.lid_of_fv fv)
in (FStar_Ident.range_of_lid uu____3277))
in (FStar_Range.string_of_use_range uu____3276))
in (

let uu____3278 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print5 "Lookup up fvar %s at location %s (lid range = %s, %s); got type %s" uu____3269 uu____3271 uu____3272 uu____3275 uu____3278))))))
end
| uu____3279 -> begin
()
end));
(

let fv' = (

let uu___96_3281 = fv
in {FStar_Syntax_Syntax.fv_name = (

let uu___97_3282 = fv.FStar_Syntax_Syntax.fv_name
in {FStar_Syntax_Syntax.v = uu___97_3282.FStar_Syntax_Syntax.v; FStar_Syntax_Syntax.ty = t; FStar_Syntax_Syntax.p = uu___97_3282.FStar_Syntax_Syntax.p}); FStar_Syntax_Syntax.fv_delta = uu___96_3281.FStar_Syntax_Syntax.fv_delta; FStar_Syntax_Syntax.fv_qual = uu___96_3281.FStar_Syntax_Syntax.fv_qual})
in (

let e = (

let uu____3296 = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_fvar (fv'))) (Some (t.FStar_Syntax_Syntax.n)) e.FStar_Syntax_Syntax.pos)
in (FStar_Syntax_Syntax.mk_Tm_uinst uu____3296 us))
in (check_instantiated_fvar env fv'.FStar_Syntax_Syntax.fv_name fv'.FStar_Syntax_Syntax.fv_qual e t)));
)
end))
end
| FStar_Syntax_Syntax.Tm_constant (c) -> begin
(

let t = (tc_constant top.FStar_Syntax_Syntax.pos c)
in (

let e = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (c))) (Some (t.FStar_Syntax_Syntax.n)) e.FStar_Syntax_Syntax.pos)
in (value_check_expected_typ env e (FStar_Util.Inl (t)) FStar_TypeChecker_Rel.trivial_guard)))
end
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(

let uu____3332 = (FStar_Syntax_Subst.open_comp bs c)
in (match (uu____3332) with
| (bs, c) -> begin
(

let env0 = env
in (

let uu____3341 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (uu____3341) with
| (env, uu____3349) -> begin
(

let uu____3352 = (tc_binders env bs)
in (match (uu____3352) with
| (bs, env, g, us) -> begin
(

let uu____3364 = (tc_comp env c)
in (match (uu____3364) with
| (c, uc, f) -> begin
(

let e = (

let uu___98_3377 = (FStar_Syntax_Util.arrow bs c)
in {FStar_Syntax_Syntax.n = uu___98_3377.FStar_Syntax_Syntax.n; FStar_Syntax_Syntax.tk = uu___98_3377.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = top.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = uu___98_3377.FStar_Syntax_Syntax.vars})
in ((check_smt_pat env e bs c);
(

let u = FStar_Syntax_Syntax.U_max ((uc)::us)
in (

let t = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (u))) None top.FStar_Syntax_Syntax.pos)
in (

let g = (

let uu____3398 = (FStar_TypeChecker_Rel.close_guard bs f)
in (FStar_TypeChecker_Rel.conj_guard g uu____3398))
in (value_check_expected_typ env0 e (FStar_Util.Inl (t)) g))));
))
end))
end))
end)))
end))
end
| FStar_Syntax_Syntax.Tm_type (u) -> begin
(

let u = (tc_universe env u)
in (

let t = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (FStar_Syntax_Syntax.U_succ (u)))) None top.FStar_Syntax_Syntax.pos)
in (

let e = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (u))) (Some (t.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in (value_check_expected_typ env e (FStar_Util.Inl (t)) FStar_TypeChecker_Rel.trivial_guard))))
end
| FStar_Syntax_Syntax.Tm_refine (x, phi) -> begin
(

let uu____3433 = (

let uu____3436 = (

let uu____3437 = (FStar_Syntax_Syntax.mk_binder x)
in (uu____3437)::[])
in (FStar_Syntax_Subst.open_term uu____3436 phi))
in (match (uu____3433) with
| (x, phi) -> begin
(

let env0 = env
in (

let uu____3444 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (uu____3444) with
| (env, uu____3452) -> begin
(

let uu____3455 = (

let uu____3462 = (FStar_List.hd x)
in (tc_binder env uu____3462))
in (match (uu____3455) with
| (x, env, f1, u) -> begin
((

let uu____3479 = (FStar_TypeChecker_Env.debug env FStar_Options.High)
in (match (uu____3479) with
| true -> begin
(

let uu____3480 = (FStar_Range.string_of_range top.FStar_Syntax_Syntax.pos)
in (

let uu____3481 = (FStar_Syntax_Print.term_to_string phi)
in (

let uu____3482 = (FStar_Syntax_Print.bv_to_string (Prims.fst x))
in (FStar_Util.print3 "(%s) Checking refinement formula %s; binder is %s\n" uu____3480 uu____3481 uu____3482))))
end
| uu____3483 -> begin
()
end));
(

let uu____3484 = (FStar_Syntax_Util.type_u ())
in (match (uu____3484) with
| (t_phi, uu____3491) -> begin
(

let uu____3492 = (tc_check_tot_or_gtot_term env phi t_phi)
in (match (uu____3492) with
| (phi, uu____3500, f2) -> begin
(

let e = (

let uu___99_3505 = (FStar_Syntax_Util.refine (Prims.fst x) phi)
in {FStar_Syntax_Syntax.n = uu___99_3505.FStar_Syntax_Syntax.n; FStar_Syntax_Syntax.tk = uu___99_3505.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = top.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = uu___99_3505.FStar_Syntax_Syntax.vars})
in (

let t = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (u))) None top.FStar_Syntax_Syntax.pos)
in (

let g = (

let uu____3524 = (FStar_TypeChecker_Rel.close_guard ((x)::[]) f2)
in (FStar_TypeChecker_Rel.conj_guard f1 uu____3524))
in (value_check_expected_typ env0 e (FStar_Util.Inl (t)) g))))
end))
end));
)
end))
end)))
end))
end
| FStar_Syntax_Syntax.Tm_abs (bs, body, uu____3533) -> begin
(

let bs = (FStar_TypeChecker_Util.maybe_add_implicit_binders env bs)
in ((

let uu____3558 = (FStar_TypeChecker_Env.debug env FStar_Options.Low)
in (match (uu____3558) with
| true -> begin
(

let uu____3559 = (FStar_Syntax_Print.term_to_string (

let uu___100_3560 = top
in {FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_abs (((bs), (body), (None))); FStar_Syntax_Syntax.tk = uu___100_3560.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = uu___100_3560.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = uu___100_3560.FStar_Syntax_Syntax.vars}))
in (FStar_Util.print1 "Abstraction is: %s\n" uu____3559))
end
| uu____3578 -> begin
()
end));
(

let uu____3579 = (FStar_Syntax_Subst.open_term bs body)
in (match (uu____3579) with
| (bs, body) -> begin
(tc_abs env top bs body)
end));
))
end
| uu____3587 -> begin
(

let uu____3588 = (

let uu____3589 = (FStar_Syntax_Print.term_to_string top)
in (

let uu____3590 = (FStar_Syntax_Print.tag_of_term top)
in (FStar_Util.format2 "Unexpected value: %s (%s)" uu____3589 uu____3590)))
in (failwith uu____3588))
end)))))
and tc_constant : FStar_Range.range  ->  FStar_Const.sconst  ->  FStar_Syntax_Syntax.typ = (fun r c -> (match (c) with
| FStar_Const.Const_unit -> begin
FStar_TypeChecker_Common.t_unit
end
| FStar_Const.Const_bool (uu____3596) -> begin
FStar_TypeChecker_Common.t_bool
end
| FStar_Const.Const_int (uu____3597, None) -> begin
FStar_TypeChecker_Common.t_int
end
| FStar_Const.Const_int (uu____3603, Some (uu____3604)) -> begin
(failwith "machine integers should be desugared")
end
| FStar_Const.Const_string (uu____3612) -> begin
FStar_TypeChecker_Common.t_string
end
| FStar_Const.Const_float (uu____3616) -> begin
FStar_TypeChecker_Common.t_float
end
| FStar_Const.Const_char (uu____3617) -> begin
FStar_TypeChecker_Common.t_char
end
| FStar_Const.Const_effect -> begin
FStar_Syntax_Util.ktype0
end
| FStar_Const.Const_range (uu____3618) -> begin
FStar_TypeChecker_Common.t_range
end
| uu____3619 -> begin
(Prims.raise (FStar_Errors.Error ((("Unsupported constant"), (r)))))
end))
and tc_comp : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.comp  ->  (FStar_Syntax_Syntax.comp * FStar_Syntax_Syntax.universe * FStar_TypeChecker_Env.guard_t) = (fun env c -> (

let c0 = c
in (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (t, uu____3630) -> begin
(

let uu____3637 = (FStar_Syntax_Util.type_u ())
in (match (uu____3637) with
| (k, u) -> begin
(

let uu____3645 = (tc_check_tot_or_gtot_term env t k)
in (match (uu____3645) with
| (t, uu____3653, g) -> begin
(

let uu____3655 = (FStar_Syntax_Syntax.mk_Total' t (Some (u)))
in ((uu____3655), (u), (g)))
end))
end))
end
| FStar_Syntax_Syntax.GTotal (t, uu____3657) -> begin
(

let uu____3664 = (FStar_Syntax_Util.type_u ())
in (match (uu____3664) with
| (k, u) -> begin
(

let uu____3672 = (tc_check_tot_or_gtot_term env t k)
in (match (uu____3672) with
| (t, uu____3680, g) -> begin
(

let uu____3682 = (FStar_Syntax_Syntax.mk_GTotal' t (Some (u)))
in ((uu____3682), (u), (g)))
end))
end))
end
| FStar_Syntax_Syntax.Comp (c) -> begin
(

let head = (FStar_Syntax_Syntax.fvar c.FStar_Syntax_Syntax.effect_name FStar_Syntax_Syntax.Delta_constant None)
in (

let head = (match (c.FStar_Syntax_Syntax.comp_univs) with
| [] -> begin
head
end
| us -> begin
((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_uinst (((head), (us))))) None c0.FStar_Syntax_Syntax.pos)
end)
in (

let tc = (

let uu____3698 = (

let uu____3699 = (

let uu____3700 = (FStar_Syntax_Syntax.as_arg c.FStar_Syntax_Syntax.result_typ)
in (uu____3700)::c.FStar_Syntax_Syntax.effect_args)
in (FStar_Syntax_Syntax.mk_Tm_app head uu____3699))
in (uu____3698 None c.FStar_Syntax_Syntax.result_typ.FStar_Syntax_Syntax.pos))
in (

let uu____3705 = (tc_check_tot_or_gtot_term env tc FStar_Syntax_Syntax.teff)
in (match (uu____3705) with
| (tc, uu____3713, f) -> begin
(

let uu____3715 = (FStar_Syntax_Util.head_and_args tc)
in (match (uu____3715) with
| (head, args) -> begin
(

let comp_univs = (

let uu____3745 = (

let uu____3746 = (FStar_Syntax_Subst.compress head)
in uu____3746.FStar_Syntax_Syntax.n)
in (match (uu____3745) with
| FStar_Syntax_Syntax.Tm_uinst (uu____3749, us) -> begin
us
end
| uu____3755 -> begin
[]
end))
in (

let uu____3756 = (FStar_Syntax_Util.head_and_args tc)
in (match (uu____3756) with
| (uu____3769, args) -> begin
(

let uu____3785 = (

let uu____3797 = (FStar_List.hd args)
in (

let uu____3806 = (FStar_List.tl args)
in ((uu____3797), (uu____3806))))
in (match (uu____3785) with
| (res, args) -> begin
(

let uu____3848 = (

let uu____3853 = (FStar_All.pipe_right c.FStar_Syntax_Syntax.flags (FStar_List.map (fun uu___80_3863 -> (match (uu___80_3863) with
| FStar_Syntax_Syntax.DECREASES (e) -> begin
(

let uu____3869 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (uu____3869) with
| (env, uu____3876) -> begin
(

let uu____3879 = (tc_tot_or_gtot_term env e)
in (match (uu____3879) with
| (e, uu____3886, g) -> begin
((FStar_Syntax_Syntax.DECREASES (e)), (g))
end))
end))
end
| f -> begin
((f), (FStar_TypeChecker_Rel.trivial_guard))
end))))
in (FStar_All.pipe_right uu____3853 FStar_List.unzip))
in (match (uu____3848) with
| (flags, guards) -> begin
(

let u = (env.FStar_TypeChecker_Env.universe_of env (Prims.fst res))
in (

let c = (FStar_Syntax_Syntax.mk_Comp (

let uu___101_3909 = c
in {FStar_Syntax_Syntax.comp_univs = comp_univs; FStar_Syntax_Syntax.effect_name = uu___101_3909.FStar_Syntax_Syntax.effect_name; FStar_Syntax_Syntax.result_typ = (Prims.fst res); FStar_Syntax_Syntax.effect_args = args; FStar_Syntax_Syntax.flags = uu___101_3909.FStar_Syntax_Syntax.flags}))
in (

let u_c = (

let uu____3913 = (FStar_TypeChecker_Env.effect_repr env c u)
in (match (uu____3913) with
| None -> begin
u
end
| Some (tm) -> begin
(env.FStar_TypeChecker_Env.universe_of env tm)
end))
in (

let uu____3916 = (FStar_List.fold_left FStar_TypeChecker_Rel.conj_guard f guards)
in ((c), (u_c), (uu____3916))))))
end))
end))
end)))
end))
end)))))
end)))
and tc_universe : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.universe = (fun env u -> (

let rec aux = (fun u -> (

let u = (FStar_Syntax_Subst.compress_univ u)
in (match (u) with
| FStar_Syntax_Syntax.U_bvar (uu____3924) -> begin
(failwith "Impossible: locally nameless")
end
| FStar_Syntax_Syntax.U_unknown -> begin
(failwith "Unknown universe")
end
| (FStar_Syntax_Syntax.U_unif (_)) | (FStar_Syntax_Syntax.U_zero) -> begin
u
end
| FStar_Syntax_Syntax.U_succ (u) -> begin
(

let uu____3927 = (aux u)
in FStar_Syntax_Syntax.U_succ (uu____3927))
end
| FStar_Syntax_Syntax.U_max (us) -> begin
(

let uu____3930 = (FStar_List.map aux us)
in FStar_Syntax_Syntax.U_max (uu____3930))
end
| FStar_Syntax_Syntax.U_name (x) -> begin
u
end)))
in (match (env.FStar_TypeChecker_Env.lax_universes) with
| true -> begin
FStar_Syntax_Syntax.U_zero
end
| uu____3933 -> begin
(match (u) with
| FStar_Syntax_Syntax.U_unknown -> begin
(

let uu____3934 = (FStar_Syntax_Util.type_u ())
in (FStar_All.pipe_right uu____3934 Prims.snd))
end
| uu____3939 -> begin
(aux u)
end)
end)))
and tc_abs : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.binders  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env top bs body -> (

let fail = (fun msg t -> (

let uu____3960 = (

let uu____3961 = (

let uu____3964 = (FStar_TypeChecker_Err.expected_a_term_of_type_t_got_a_function env msg t top)
in ((uu____3964), (top.FStar_Syntax_Syntax.pos)))
in FStar_Errors.Error (uu____3961))
in (Prims.raise uu____3960)))
in (

let check_binders = (fun env bs bs_expected -> (

let rec aux = (fun uu____4018 bs bs_expected -> (match (uu____4018) with
| (env, out, g, subst) -> begin
(match (((bs), (bs_expected))) with
| ([], []) -> begin
((env), ((FStar_List.rev out)), (None), (g), (subst))
end
| (((hd, imp))::bs, ((hd_expected, imp'))::bs_expected) -> begin
((match (((imp), (imp'))) with
| ((None, Some (FStar_Syntax_Syntax.Implicit (_)))) | ((Some (FStar_Syntax_Syntax.Implicit (_)), None)) -> begin
(

let uu____4115 = (

let uu____4116 = (

let uu____4119 = (

let uu____4120 = (FStar_Syntax_Print.bv_to_string hd)
in (FStar_Util.format1 "Inconsistent implicit argument annotation on argument %s" uu____4120))
in (

let uu____4121 = (FStar_Syntax_Syntax.range_of_bv hd)
in ((uu____4119), (uu____4121))))
in FStar_Errors.Error (uu____4116))
in (Prims.raise uu____4115))
end
| uu____4122 -> begin
()
end);
(

let expected_t = (FStar_Syntax_Subst.subst subst hd_expected.FStar_Syntax_Syntax.sort)
in (

let uu____4126 = (

let uu____4129 = (

let uu____4130 = (FStar_Syntax_Util.unmeta hd.FStar_Syntax_Syntax.sort)
in uu____4130.FStar_Syntax_Syntax.n)
in (match (uu____4129) with
| FStar_Syntax_Syntax.Tm_unknown -> begin
((expected_t), (g))
end
| uu____4135 -> begin
((

let uu____4137 = (FStar_TypeChecker_Env.debug env FStar_Options.High)
in (match (uu____4137) with
| true -> begin
(

let uu____4138 = (FStar_Syntax_Print.bv_to_string hd)
in (FStar_Util.print1 "Checking binder %s\n" uu____4138))
end
| uu____4139 -> begin
()
end));
(

let uu____4140 = (tc_tot_or_gtot_term env hd.FStar_Syntax_Syntax.sort)
in (match (uu____4140) with
| (t, uu____4147, g1) -> begin
(

let g2 = (

let uu____4150 = (FStar_TypeChecker_Env.get_range env)
in (

let uu____4151 = (FStar_TypeChecker_Rel.teq env t expected_t)
in (FStar_TypeChecker_Util.label_guard uu____4150 "Type annotation on parameter incompatible with the expected type" uu____4151)))
in (

let g = (

let uu____4153 = (FStar_TypeChecker_Rel.conj_guard g1 g2)
in (FStar_TypeChecker_Rel.conj_guard g uu____4153))
in ((t), (g))))
end));
)
end))
in (match (uu____4126) with
| (t, g) -> begin
(

let hd = (

let uu___102_4169 = hd
in {FStar_Syntax_Syntax.ppname = uu___102_4169.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___102_4169.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = t})
in (

let b = ((hd), (imp))
in (

let b_expected = ((hd_expected), (imp'))
in (

let env = (push_binding env b)
in (

let subst = (

let uu____4178 = (FStar_Syntax_Syntax.bv_to_name hd)
in (maybe_extend_subst subst b_expected uu____4178))
in (aux ((env), ((b)::out), (g), (subst)) bs bs_expected))))))
end)));
)
end
| (rest, []) -> begin
((env), ((FStar_List.rev out)), (Some (FStar_Util.Inl (rest))), (g), (subst))
end
| ([], rest) -> begin
((env), ((FStar_List.rev out)), (Some (FStar_Util.Inr (rest))), (g), (subst))
end)
end))
in (aux ((env), ([]), (FStar_TypeChecker_Rel.trivial_guard), ([])) bs bs_expected)))
in (

let rec expected_function_typ = (fun env t0 body -> (match (t0) with
| None -> begin
((match (env.FStar_TypeChecker_Env.letrecs) with
| [] -> begin
()
end
| uu____4274 -> begin
(failwith "Impossible: Can\'t have a let rec annotation but no expected type")
end);
(

let uu____4278 = (tc_binders env bs)
in (match (uu____4278) with
| (bs, envbody, g, uu____4297) -> begin
(

let uu____4298 = (

let uu____4303 = (

let uu____4304 = (FStar_Syntax_Subst.compress body)
in uu____4304.FStar_Syntax_Syntax.n)
in (match (uu____4303) with
| FStar_Syntax_Syntax.Tm_ascribed (e, FStar_Util.Inr (c), uu____4313) -> begin
(

let uu____4332 = (tc_comp envbody c)
in (match (uu____4332) with
| (c, uu____4341, g') -> begin
(

let uu____4343 = (FStar_TypeChecker_Rel.conj_guard g g')
in ((Some (c)), (body), (uu____4343)))
end))
end
| uu____4345 -> begin
((None), (body), (g))
end))
in (match (uu____4298) with
| (copt, body, g) -> begin
((None), (bs), ([]), (copt), (envbody), (body), (g))
end))
end));
)
end
| Some (t) -> begin
(

let t = (FStar_Syntax_Subst.compress t)
in (

let rec as_function_typ = (fun norm t -> (

let uu____4395 = (

let uu____4396 = (FStar_Syntax_Subst.compress t)
in uu____4396.FStar_Syntax_Syntax.n)
in (match (uu____4395) with
| (FStar_Syntax_Syntax.Tm_uvar (_)) | (FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar (_); FStar_Syntax_Syntax.tk = _; FStar_Syntax_Syntax.pos = _; FStar_Syntax_Syntax.vars = _}, _)) -> begin
((match (env.FStar_TypeChecker_Env.letrecs) with
| [] -> begin
()
end
| uu____4427 -> begin
(failwith "Impossible")
end);
(

let uu____4431 = (tc_binders env bs)
in (match (uu____4431) with
| (bs, envbody, g, uu____4451) -> begin
(

let uu____4452 = (FStar_TypeChecker_Env.clear_expected_typ envbody)
in (match (uu____4452) with
| (envbody, uu____4469) -> begin
((Some (((t), (true)))), (bs), ([]), (None), (envbody), (body), (g))
end))
end));
)
end
| FStar_Syntax_Syntax.Tm_refine (b, uu____4480) -> begin
(

let uu____4485 = (as_function_typ norm b.FStar_Syntax_Syntax.sort)
in (match (uu____4485) with
| (uu____4510, bs, bs', copt, env, body, g) -> begin
((Some (((t), (false)))), (bs), (bs'), (copt), (env), (body), (g))
end))
end
| FStar_Syntax_Syntax.Tm_arrow (bs_expected, c_expected) -> begin
(

let uu____4546 = (FStar_Syntax_Subst.open_comp bs_expected c_expected)
in (match (uu____4546) with
| (bs_expected, c_expected) -> begin
(

let check_actuals_against_formals = (fun env bs bs_expected -> (

let rec handle_more = (fun uu____4607 c_expected -> (match (uu____4607) with
| (env, bs, more, guard, subst) -> begin
(match (more) with
| None -> begin
(

let uu____4668 = (FStar_Syntax_Subst.subst_comp subst c_expected)
in ((env), (bs), (guard), (uu____4668)))
end
| Some (FStar_Util.Inr (more_bs_expected)) -> begin
(

let c = (

let uu____4685 = (FStar_Syntax_Util.arrow more_bs_expected c_expected)
in (FStar_Syntax_Syntax.mk_Total uu____4685))
in (

let uu____4686 = (FStar_Syntax_Subst.subst_comp subst c)
in ((env), (bs), (guard), (uu____4686))))
end
| Some (FStar_Util.Inl (more_bs)) -> begin
(

let c = (FStar_Syntax_Subst.subst_comp subst c_expected)
in (match ((FStar_Syntax_Util.is_named_tot c)) with
| true -> begin
(

let t = (unfold_whnf env (FStar_Syntax_Util.comp_result c))
in (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_arrow (bs_expected, c_expected) -> begin
(

let uu____4727 = (check_binders env more_bs bs_expected)
in (match (uu____4727) with
| (env, bs', more, guard', subst) -> begin
(

let uu____4754 = (

let uu____4770 = (FStar_TypeChecker_Rel.conj_guard guard guard')
in ((env), ((FStar_List.append bs bs')), (more), (uu____4770), (subst)))
in (handle_more uu____4754 c_expected))
end))
end
| uu____4779 -> begin
(

let uu____4780 = (

let uu____4781 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.format1 "More arguments than annotated type (%s)" uu____4781))
in (fail uu____4780 t))
end))
end
| uu____4789 -> begin
(fail "Function definition takes more arguments than expected from its annotated type" t)
end))
end)
end))
in (

let uu____4797 = (check_binders env bs bs_expected)
in (handle_more uu____4797 c_expected))))
in (

let mk_letrec_env = (fun envbody bs c -> (

let letrecs = (guard_letrecs envbody bs c)
in (

let envbody = (

let uu___103_4835 = envbody
in {FStar_TypeChecker_Env.solver = uu___103_4835.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___103_4835.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___103_4835.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___103_4835.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___103_4835.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___103_4835.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___103_4835.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___103_4835.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___103_4835.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = uu___103_4835.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___103_4835.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___103_4835.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = []; FStar_TypeChecker_Env.top_level = uu___103_4835.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = uu___103_4835.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = uu___103_4835.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = uu___103_4835.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___103_4835.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = uu___103_4835.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = uu___103_4835.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___103_4835.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___103_4835.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = uu___103_4835.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = uu___103_4835.FStar_TypeChecker_Env.qname_and_index})
in (FStar_All.pipe_right letrecs (FStar_List.fold_left (fun uu____4849 uu____4850 -> (match (((uu____4849), (uu____4850))) with
| ((env, letrec_binders), (l, t)) -> begin
(

let uu____4875 = (

let uu____4879 = (

let uu____4880 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (FStar_All.pipe_right uu____4880 Prims.fst))
in (tc_term uu____4879 t))
in (match (uu____4875) with
| (t, uu____4892, uu____4893) -> begin
(

let env = (FStar_TypeChecker_Env.push_let_binding env l (([]), (t)))
in (

let lb = (match (l) with
| FStar_Util.Inl (x) -> begin
(

let uu____4900 = (FStar_Syntax_Syntax.mk_binder (

let uu___104_4901 = x
in {FStar_Syntax_Syntax.ppname = uu___104_4901.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___104_4901.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = t}))
in (uu____4900)::letrec_binders)
end
| uu____4902 -> begin
letrec_binders
end)
in ((env), (lb))))
end))
end)) ((envbody), ([])))))))
in (

let uu____4905 = (check_actuals_against_formals env bs bs_expected)
in (match (uu____4905) with
| (envbody, bs, g, c) -> begin
(

let uu____4935 = (

let uu____4939 = (FStar_TypeChecker_Env.should_verify env)
in (match (uu____4939) with
| true -> begin
(mk_letrec_env envbody bs c)
end
| uu____4943 -> begin
((envbody), ([]))
end))
in (match (uu____4935) with
| (envbody, letrecs) -> begin
(

let envbody = (FStar_TypeChecker_Env.set_expected_typ envbody (FStar_Syntax_Util.comp_result c))
in ((Some (((t), (false)))), (bs), (letrecs), (Some (c)), (envbody), (body), (g)))
end))
end))))
end))
end
| uu____4972 -> begin
(match ((not (norm))) with
| true -> begin
(

let uu____4985 = (unfold_whnf env t)
in (as_function_typ true uu____4985))
end
| uu____4986 -> begin
(

let uu____4987 = (expected_function_typ env None body)
in (match (uu____4987) with
| (uu____5011, bs, uu____5013, c_opt, envbody, body, g) -> begin
((Some (((t), (false)))), (bs), ([]), (c_opt), (envbody), (body), (g))
end))
end)
end)))
in (as_function_typ false t)))
end))
in (

let use_eq = env.FStar_TypeChecker_Env.use_eq
in (

let uu____5034 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (uu____5034) with
| (env, topt) -> begin
((

let uu____5046 = (FStar_TypeChecker_Env.debug env FStar_Options.High)
in (match (uu____5046) with
| true -> begin
(

let uu____5047 = (match (topt) with
| None -> begin
"None"
end
| Some (t) -> begin
(FStar_Syntax_Print.term_to_string t)
end)
in (FStar_Util.print2 "!!!!!!!!!!!!!!!Expected type is %s, top_level=%s\n" uu____5047 (match (env.FStar_TypeChecker_Env.top_level) with
| true -> begin
"true"
end
| uu____5049 -> begin
"false"
end)))
end
| uu____5050 -> begin
()
end));
(

let uu____5051 = (expected_function_typ env topt body)
in (match (uu____5051) with
| (tfun_opt, bs, letrec_binders, c_opt, envbody, body, g) -> begin
(

let uu____5081 = (tc_term (

let uu___105_5085 = envbody
in {FStar_TypeChecker_Env.solver = uu___105_5085.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___105_5085.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___105_5085.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___105_5085.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___105_5085.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___105_5085.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___105_5085.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___105_5085.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___105_5085.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = uu___105_5085.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___105_5085.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___105_5085.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = uu___105_5085.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = false; FStar_TypeChecker_Env.check_uvars = uu___105_5085.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = use_eq; FStar_TypeChecker_Env.is_iface = uu___105_5085.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___105_5085.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = uu___105_5085.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = uu___105_5085.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___105_5085.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___105_5085.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = uu___105_5085.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = uu___105_5085.FStar_TypeChecker_Env.qname_and_index}) body)
in (match (uu____5081) with
| (body, cbody, guard_body) -> begin
(

let guard_body = (FStar_TypeChecker_Rel.solve_deferred_constraints envbody guard_body)
in ((

let uu____5094 = (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env) (FStar_Options.Other ("Implicits")))
in (match (uu____5094) with
| true -> begin
(

let uu____5095 = (FStar_All.pipe_left FStar_Util.string_of_int (FStar_List.length guard_body.FStar_TypeChecker_Env.implicits))
in (

let uu____5104 = (

let uu____5105 = (cbody.FStar_Syntax_Syntax.comp ())
in (FStar_All.pipe_left FStar_Syntax_Print.comp_to_string uu____5105))
in (FStar_Util.print2 "Introduced %s implicits in body of abstraction\nAfter solving constraints, cbody is %s\n" uu____5095 uu____5104)))
end
| uu____5106 -> begin
()
end));
(

let uu____5107 = (

let uu____5111 = (

let uu____5114 = (cbody.FStar_Syntax_Syntax.comp ())
in ((body), (uu____5114)))
in (check_expected_effect (

let uu___106_5119 = envbody
in {FStar_TypeChecker_Env.solver = uu___106_5119.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___106_5119.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___106_5119.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___106_5119.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___106_5119.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___106_5119.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___106_5119.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___106_5119.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___106_5119.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = uu___106_5119.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___106_5119.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___106_5119.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = uu___106_5119.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = uu___106_5119.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = uu___106_5119.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = use_eq; FStar_TypeChecker_Env.is_iface = uu___106_5119.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___106_5119.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = uu___106_5119.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = uu___106_5119.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___106_5119.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___106_5119.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = uu___106_5119.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = uu___106_5119.FStar_TypeChecker_Env.qname_and_index}) c_opt uu____5111))
in (match (uu____5107) with
| (body, cbody, guard) -> begin
(

let guard = (FStar_TypeChecker_Rel.conj_guard guard_body guard)
in (

let guard = (

let uu____5128 = (env.FStar_TypeChecker_Env.top_level || (

let uu____5129 = (FStar_TypeChecker_Env.should_verify env)
in (not (uu____5129))))
in (match (uu____5128) with
| true -> begin
(

let uu____5130 = (FStar_TypeChecker_Rel.conj_guard g guard)
in (FStar_TypeChecker_Rel.discharge_guard envbody uu____5130))
end
| uu____5131 -> begin
(

let guard = (

let uu____5133 = (FStar_TypeChecker_Rel.conj_guard g guard)
in (FStar_TypeChecker_Rel.close_guard (FStar_List.append bs letrec_binders) uu____5133))
in guard)
end))
in (

let tfun_computed = (FStar_Syntax_Util.arrow bs cbody)
in (

let e = (

let uu____5140 = (

let uu____5147 = (

let uu____5153 = (FStar_All.pipe_right (FStar_Util.dflt cbody c_opt) FStar_Syntax_Util.lcomp_of_comp)
in (FStar_All.pipe_right uu____5153 (fun _0_29 -> FStar_Util.Inl (_0_29))))
in Some (uu____5147))
in (FStar_Syntax_Util.abs bs body uu____5140))
in (

let uu____5167 = (match (tfun_opt) with
| Some (t, use_teq) -> begin
(

let t = (FStar_Syntax_Subst.compress t)
in (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_arrow (uu____5182) -> begin
((e), (t), (guard))
end
| uu____5190 -> begin
(

let uu____5191 = (match (use_teq) with
| true -> begin
(

let uu____5196 = (FStar_TypeChecker_Rel.teq env t tfun_computed)
in ((e), (uu____5196)))
end
| uu____5197 -> begin
(FStar_TypeChecker_Util.check_and_ascribe env e tfun_computed t)
end)
in (match (uu____5191) with
| (e, guard') -> begin
(

let uu____5203 = (FStar_TypeChecker_Rel.conj_guard guard guard')
in ((e), (t), (uu____5203)))
end))
end))
end
| None -> begin
((e), (tfun_computed), (guard))
end)
in (match (uu____5167) with
| (e, tfun, guard) -> begin
(

let c = (match (env.FStar_TypeChecker_Env.top_level) with
| true -> begin
(FStar_Syntax_Syntax.mk_Total tfun)
end
| uu____5215 -> begin
(FStar_TypeChecker_Util.return_value env tfun e)
end)
in (

let uu____5216 = (FStar_TypeChecker_Util.strengthen_precondition None env e (FStar_Syntax_Util.lcomp_of_comp c) guard)
in (match (uu____5216) with
| (c, g) -> begin
((e), (c), (g))
end)))
end))))))
end));
))
end))
end));
)
end)))))))
and check_application_args : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.lcomp  ->  FStar_TypeChecker_Env.guard_t  ->  ((FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.aqual) Prims.list  ->  FStar_Syntax_Syntax.typ Prims.option  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env head chead ghead args expected_topt -> (

let n_args = (FStar_List.length args)
in (

let r = (FStar_TypeChecker_Env.get_range env)
in (

let thead = chead.FStar_Syntax_Syntax.res_typ
in ((

let uu____5252 = (FStar_TypeChecker_Env.debug env FStar_Options.High)
in (match (uu____5252) with
| true -> begin
(

let uu____5253 = (FStar_Range.string_of_range head.FStar_Syntax_Syntax.pos)
in (

let uu____5254 = (FStar_Syntax_Print.term_to_string thead)
in (FStar_Util.print2 "(%s) Type of head is %s\n" uu____5253 uu____5254)))
end
| uu____5255 -> begin
()
end));
(

let monadic_application = (fun uu____5296 subst arg_comps_rev arg_rets guard fvs bs -> (match (uu____5296) with
| (head, chead, ghead, cres) -> begin
(

let rt = (check_no_escape (Some (head)) env fvs cres.FStar_Syntax_Syntax.res_typ)
in (

let cres = (

let uu___107_5337 = cres
in {FStar_Syntax_Syntax.eff_name = uu___107_5337.FStar_Syntax_Syntax.eff_name; FStar_Syntax_Syntax.res_typ = rt; FStar_Syntax_Syntax.cflags = uu___107_5337.FStar_Syntax_Syntax.cflags; FStar_Syntax_Syntax.comp = uu___107_5337.FStar_Syntax_Syntax.comp})
in (

let uu____5338 = (match (bs) with
| [] -> begin
(

let cres = (FStar_TypeChecker_Util.subst_lcomp subst cres)
in (

let g = (FStar_TypeChecker_Rel.conj_guard ghead guard)
in (

let refine_with_equality = ((FStar_Syntax_Util.is_pure_or_ghost_lcomp cres) && (FStar_All.pipe_right arg_comps_rev (FStar_Util.for_some (fun uu___81_5365 -> (match (uu___81_5365) with
| (uu____5374, uu____5375, FStar_Util.Inl (uu____5376)) -> begin
false
end
| (uu____5387, uu____5388, FStar_Util.Inr (c)) -> begin
(

let uu____5398 = (FStar_Syntax_Util.is_pure_or_ghost_lcomp c)
in (not (uu____5398)))
end)))))
in (

let cres = (match (refine_with_equality) with
| true -> begin
(

let uu____5400 = ((FStar_Syntax_Syntax.mk_Tm_app head (FStar_List.rev arg_rets)) (Some (cres.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) r)
in (FStar_TypeChecker_Util.maybe_assume_result_eq_pure_term env uu____5400 cres))
end
| uu____5409 -> begin
((

let uu____5411 = (FStar_TypeChecker_Env.debug env FStar_Options.Low)
in (match (uu____5411) with
| true -> begin
(

let uu____5412 = (FStar_Syntax_Print.term_to_string head)
in (

let uu____5413 = (FStar_Syntax_Print.lcomp_to_string cres)
in (

let uu____5414 = (FStar_TypeChecker_Rel.guard_to_string env g)
in (FStar_Util.print3 "Not refining result: f=%s; cres=%s; guard=%s\n" uu____5412 uu____5413 uu____5414))))
end
| uu____5415 -> begin
()
end));
cres;
)
end)
in ((cres), (g))))))
end
| uu____5416 -> begin
(

let g = (

let uu____5421 = (FStar_TypeChecker_Rel.conj_guard ghead guard)
in (FStar_All.pipe_right uu____5421 (FStar_TypeChecker_Rel.solve_deferred_constraints env)))
in (

let uu____5422 = (

let uu____5423 = (

let uu____5426 = (

let uu____5427 = (

let uu____5428 = (cres.FStar_Syntax_Syntax.comp ())
in (FStar_Syntax_Util.arrow bs uu____5428))
in (FStar_All.pipe_left (FStar_Syntax_Subst.subst subst) uu____5427))
in (FStar_Syntax_Syntax.mk_Total uu____5426))
in (FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp uu____5423))
in ((uu____5422), (g))))
end)
in (match (uu____5338) with
| (cres, guard) -> begin
((

let uu____5439 = (FStar_TypeChecker_Env.debug env FStar_Options.Low)
in (match (uu____5439) with
| true -> begin
(

let uu____5440 = (FStar_Syntax_Print.lcomp_to_string cres)
in (FStar_Util.print1 "\t Type of result cres is %s\n" uu____5440))
end
| uu____5441 -> begin
()
end));
(

let comp = (FStar_List.fold_left (fun out_c uu____5456 -> (match (uu____5456) with
| ((e, q), x, c) -> begin
(match (c) with
| FStar_Util.Inl (eff_name, arg_typ) -> begin
out_c
end
| FStar_Util.Inr (c) -> begin
(FStar_TypeChecker_Util.bind e.FStar_Syntax_Syntax.pos env None c ((x), (out_c)))
end)
end)) cres arg_comps_rev)
in (

let comp = (FStar_TypeChecker_Util.bind head.FStar_Syntax_Syntax.pos env None chead ((None), (comp)))
in (

let shortcuts_evaluation_order = (

let uu____5502 = (

let uu____5503 = (FStar_Syntax_Subst.compress head)
in uu____5503.FStar_Syntax_Syntax.n)
in (match (uu____5502) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
((FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.op_And) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.op_Or))
end
| uu____5507 -> begin
false
end))
in (

let app = (match (shortcuts_evaluation_order) with
| true -> begin
(

let args = (FStar_List.fold_left (fun args uu____5521 -> (match (uu____5521) with
| (arg, uu____5533, uu____5534) -> begin
(arg)::args
end)) [] arg_comps_rev)
in (

let app = ((FStar_Syntax_Syntax.mk_Tm_app head args) (Some (comp.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) r)
in (

let app = (FStar_TypeChecker_Util.maybe_lift env app cres.FStar_Syntax_Syntax.eff_name comp.FStar_Syntax_Syntax.eff_name comp.FStar_Syntax_Syntax.res_typ)
in (FStar_TypeChecker_Util.maybe_monadic env app comp.FStar_Syntax_Syntax.eff_name comp.FStar_Syntax_Syntax.res_typ))))
end
| uu____5553 -> begin
(

let uu____5554 = (

let map_fun = (fun uu____5593 -> (match (uu____5593) with
| ((e, q), uu____5617, c0) -> begin
(match (c0) with
| FStar_Util.Inl (uu____5642) -> begin
((None), (((e), (q))))
end
| FStar_Util.Inr (c) when (FStar_Syntax_Util.is_pure_or_ghost_lcomp c) -> begin
((None), (((e), (q))))
end
| FStar_Util.Inr (c) -> begin
(

let x = (FStar_Syntax_Syntax.new_bv None c.FStar_Syntax_Syntax.res_typ)
in (

let e = (FStar_TypeChecker_Util.maybe_lift env e c.FStar_Syntax_Syntax.eff_name comp.FStar_Syntax_Syntax.eff_name c.FStar_Syntax_Syntax.res_typ)
in (

let uu____5685 = (

let uu____5688 = (FStar_Syntax_Syntax.bv_to_name x)
in ((uu____5688), (q)))
in ((Some (((x), (c.FStar_Syntax_Syntax.eff_name), (c.FStar_Syntax_Syntax.res_typ), (e)))), (uu____5685)))))
end)
end))
in (

let uu____5706 = (

let uu____5720 = (

let uu____5733 = (

let uu____5745 = (

let uu____5754 = (FStar_Syntax_Syntax.as_arg head)
in ((uu____5754), (None), (FStar_Util.Inr (chead))))
in (uu____5745)::arg_comps_rev)
in (FStar_List.map map_fun uu____5733))
in (FStar_All.pipe_left FStar_List.split uu____5720))
in (match (uu____5706) with
| (lifted_args, reverse_args) -> begin
(

let uu____5863 = (

let uu____5864 = (FStar_List.hd reverse_args)
in (Prims.fst uu____5864))
in (

let uu____5869 = (

let uu____5873 = (FStar_List.tl reverse_args)
in (FStar_List.rev uu____5873))
in ((lifted_args), (uu____5863), (uu____5869))))
end)))
in (match (uu____5554) with
| (lifted_args, head, args) -> begin
(

let app = ((FStar_Syntax_Syntax.mk_Tm_app head args) (Some (comp.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) r)
in (

let app = (FStar_TypeChecker_Util.maybe_lift env app cres.FStar_Syntax_Syntax.eff_name comp.FStar_Syntax_Syntax.eff_name comp.FStar_Syntax_Syntax.res_typ)
in (

let app = (FStar_TypeChecker_Util.maybe_monadic env app comp.FStar_Syntax_Syntax.eff_name comp.FStar_Syntax_Syntax.res_typ)
in (

let bind_lifted_args = (fun e uu___82_5941 -> (match (uu___82_5941) with
| None -> begin
e
end
| Some (x, m, t, e1) -> begin
(

let lb = (FStar_Syntax_Util.mk_letbinding (FStar_Util.Inl (x)) [] t m e1)
in (

let letbinding = (

let uu____5983 = (

let uu____5986 = (

let uu____5987 = (

let uu____5995 = (

let uu____5996 = (

let uu____5997 = (FStar_Syntax_Syntax.mk_binder x)
in (uu____5997)::[])
in (FStar_Syntax_Subst.close uu____5996 e))
in ((((false), ((lb)::[]))), (uu____5995)))
in FStar_Syntax_Syntax.Tm_let (uu____5987))
in (FStar_Syntax_Syntax.mk uu____5986))
in (uu____5983 None e.FStar_Syntax_Syntax.pos))
in ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_meta (((letbinding), (FStar_Syntax_Syntax.Meta_monadic (((m), (comp.FStar_Syntax_Syntax.res_typ)))))))) None e.FStar_Syntax_Syntax.pos)))
end))
in (FStar_List.fold_left bind_lifted_args app lifted_args)))))
end))
end)
in (

let uu____6031 = (FStar_TypeChecker_Util.strengthen_precondition None env app comp guard)
in (match (uu____6031) with
| (comp, g) -> begin
((app), (comp), (g))
end))))));
)
end))))
end))
in (

let rec tc_args = (fun head_info uu____6089 bs args -> (match (uu____6089) with
| (subst, outargs, arg_rets, g, fvs) -> begin
(match (((bs), (args))) with
| (((x, Some (FStar_Syntax_Syntax.Implicit (uu____6184))))::rest, ((uu____6186, None))::uu____6187) -> begin
(

let t = (FStar_Syntax_Subst.subst subst x.FStar_Syntax_Syntax.sort)
in (

let t = (check_no_escape (Some (head)) env fvs t)
in (

let uu____6224 = (FStar_TypeChecker_Util.new_implicit_var "Instantiating implicit argument in application" head.FStar_Syntax_Syntax.pos env t)
in (match (uu____6224) with
| (varg, uu____6235, implicits) -> begin
(

let subst = (FStar_Syntax_Syntax.NT (((x), (varg))))::subst
in (

let arg = (

let uu____6248 = (FStar_Syntax_Syntax.as_implicit true)
in ((varg), (uu____6248)))
in (

let uu____6249 = (

let uu____6271 = (FStar_TypeChecker_Rel.conj_guard implicits g)
in ((subst), ((((arg), (None), (FStar_Util.Inl (((FStar_Syntax_Const.effect_Tot_lid), (t))))))::outargs), ((arg)::arg_rets), (uu____6271), (fvs)))
in (tc_args head_info uu____6249 rest args))))
end))))
end
| (((x, aqual))::rest, ((e, aq))::rest') -> begin
((match (((aqual), (aq))) with
| ((Some (FStar_Syntax_Syntax.Implicit (_)), Some (FStar_Syntax_Syntax.Implicit (_)))) | ((None, None)) | ((Some (FStar_Syntax_Syntax.Equality), None)) -> begin
()
end
| uu____6362 -> begin
(Prims.raise (FStar_Errors.Error ((("Inconsistent implicit qualifier"), (e.FStar_Syntax_Syntax.pos)))))
end);
(

let targ = (FStar_Syntax_Subst.subst subst x.FStar_Syntax_Syntax.sort)
in (

let x = (

let uu___108_6369 = x
in {FStar_Syntax_Syntax.ppname = uu___108_6369.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___108_6369.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = targ})
in ((

let uu____6371 = (FStar_TypeChecker_Env.debug env FStar_Options.Extreme)
in (match (uu____6371) with
| true -> begin
(

let uu____6372 = (FStar_Syntax_Print.term_to_string targ)
in (FStar_Util.print1 "\tType of arg (after subst) = %s\n" uu____6372))
end
| uu____6373 -> begin
()
end));
(

let targ = (check_no_escape (Some (head)) env fvs targ)
in (

let env = (FStar_TypeChecker_Env.set_expected_typ env targ)
in (

let env = (

let uu___109_6377 = env
in {FStar_TypeChecker_Env.solver = uu___109_6377.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___109_6377.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___109_6377.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___109_6377.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___109_6377.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___109_6377.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___109_6377.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___109_6377.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___109_6377.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = uu___109_6377.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___109_6377.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___109_6377.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = uu___109_6377.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = uu___109_6377.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = uu___109_6377.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = (is_eq aqual); FStar_TypeChecker_Env.is_iface = uu___109_6377.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___109_6377.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = uu___109_6377.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = uu___109_6377.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___109_6377.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___109_6377.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = uu___109_6377.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = uu___109_6377.FStar_TypeChecker_Env.qname_and_index})
in ((

let uu____6379 = (FStar_TypeChecker_Env.debug env FStar_Options.High)
in (match (uu____6379) with
| true -> begin
(

let uu____6380 = (FStar_Syntax_Print.tag_of_term e)
in (

let uu____6381 = (FStar_Syntax_Print.term_to_string e)
in (

let uu____6382 = (FStar_Syntax_Print.term_to_string targ)
in (FStar_Util.print3 "Checking arg (%s) %s at type %s\n" uu____6380 uu____6381 uu____6382))))
end
| uu____6383 -> begin
()
end));
(

let uu____6384 = (tc_term env e)
in (match (uu____6384) with
| (e, c, g_e) -> begin
(

let g = (FStar_TypeChecker_Rel.conj_guard g g_e)
in (

let arg = ((e), (aq))
in (

let uu____6400 = (FStar_Syntax_Util.is_tot_or_gtot_lcomp c)
in (match (uu____6400) with
| true -> begin
(

let subst = (

let uu____6405 = (FStar_List.hd bs)
in (maybe_extend_subst subst uu____6405 e))
in (tc_args head_info ((subst), ((((arg), (None), (FStar_Util.Inl (((c.FStar_Syntax_Syntax.eff_name), (c.FStar_Syntax_Syntax.res_typ))))))::outargs), ((arg)::arg_rets), (g), (fvs)) rest rest'))
end
| uu____6460 -> begin
(

let uu____6461 = (FStar_TypeChecker_Util.is_pure_or_ghost_effect env c.FStar_Syntax_Syntax.eff_name)
in (match (uu____6461) with
| true -> begin
(

let subst = (

let uu____6466 = (FStar_List.hd bs)
in (maybe_extend_subst subst uu____6466 e))
in (tc_args head_info ((subst), ((((arg), (Some (x)), (FStar_Util.Inr (c))))::outargs), ((arg)::arg_rets), (g), (fvs)) rest rest'))
end
| uu____6511 -> begin
(

let uu____6512 = (

let uu____6513 = (FStar_List.hd bs)
in (FStar_Syntax_Syntax.is_null_binder uu____6513))
in (match (uu____6512) with
| true -> begin
(

let newx = (FStar_Syntax_Syntax.new_bv (Some (e.FStar_Syntax_Syntax.pos)) c.FStar_Syntax_Syntax.res_typ)
in (

let arg' = (

let uu____6522 = (FStar_Syntax_Syntax.bv_to_name newx)
in (FStar_All.pipe_left FStar_Syntax_Syntax.as_arg uu____6522))
in (tc_args head_info ((subst), ((((arg), (Some (newx)), (FStar_Util.Inr (c))))::outargs), ((arg')::arg_rets), (g), (fvs)) rest rest')))
end
| uu____6559 -> begin
(

let uu____6560 = (

let uu____6582 = (

let uu____6584 = (

let uu____6585 = (FStar_Syntax_Syntax.bv_to_name x)
in (FStar_Syntax_Syntax.as_arg uu____6585))
in (uu____6584)::arg_rets)
in ((subst), ((((arg), (Some (x)), (FStar_Util.Inr (c))))::outargs), (uu____6582), (g), ((x)::fvs)))
in (tc_args head_info uu____6560 rest rest'))
end))
end))
end))))
end));
))));
)));
)
end
| (uu____6622, []) -> begin
(monadic_application head_info subst outargs arg_rets g fvs bs)
end
| ([], (arg)::uu____6643) -> begin
(

let uu____6673 = (monadic_application head_info subst outargs arg_rets g fvs [])
in (match (uu____6673) with
| (head, chead, ghead) -> begin
(

let rec aux = (fun norm tres -> (

let tres = (

let uu____6696 = (FStar_Syntax_Subst.compress tres)
in (FStar_All.pipe_right uu____6696 FStar_Syntax_Util.unrefine))
in (match (tres.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_arrow (bs, cres') -> begin
(

let uu____6712 = (FStar_Syntax_Subst.open_comp bs cres')
in (match (uu____6712) with
| (bs, cres') -> begin
(

let head_info = ((head), (chead), (ghead), ((FStar_Syntax_Util.lcomp_of_comp cres')))
in ((

let uu____6726 = (FStar_TypeChecker_Env.debug env FStar_Options.Low)
in (match (uu____6726) with
| true -> begin
(

let uu____6727 = (FStar_Range.string_of_range tres.FStar_Syntax_Syntax.pos)
in (FStar_Util.print1 "%s: Warning: Potentially redundant explicit currying of a function type \n" uu____6727))
end
| uu____6728 -> begin
()
end));
(tc_args head_info (([]), ([]), ([]), (FStar_TypeChecker_Rel.trivial_guard), ([])) bs args);
))
end))
end
| uu____6757 when (not (norm)) -> begin
(

let uu____6758 = (unfold_whnf env tres)
in (aux true uu____6758))
end
| uu____6759 -> begin
(

let uu____6760 = (

let uu____6761 = (

let uu____6764 = (

let uu____6765 = (FStar_TypeChecker_Normalize.term_to_string env thead)
in (

let uu____6766 = (FStar_Util.string_of_int n_args)
in (FStar_Util.format2 "Too many arguments to function of type %s; got %s arguments" uu____6765 uu____6766)))
in (

let uu____6770 = (FStar_Syntax_Syntax.argpos arg)
in ((uu____6764), (uu____6770))))
in FStar_Errors.Error (uu____6761))
in (Prims.raise uu____6760))
end)))
in (aux false chead.FStar_Syntax_Syntax.res_typ))
end))
end)
end))
in (

let rec check_function_app = (fun norm tf -> (

let uu____6786 = (

let uu____6787 = (FStar_Syntax_Util.unrefine tf)
in uu____6787.FStar_Syntax_Syntax.n)
in (match (uu____6786) with
| (FStar_Syntax_Syntax.Tm_uvar (_)) | (FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar (_); FStar_Syntax_Syntax.tk = _; FStar_Syntax_Syntax.pos = _; FStar_Syntax_Syntax.vars = _}, _)) -> begin
(

let rec tc_args = (fun env args -> (match (args) with
| [] -> begin
(([]), ([]), (FStar_TypeChecker_Rel.trivial_guard))
end
| ((e, imp))::tl -> begin
(

let uu____6863 = (tc_term env e)
in (match (uu____6863) with
| (e, c, g_e) -> begin
(

let uu____6876 = (tc_args env tl)
in (match (uu____6876) with
| (args, comps, g_rest) -> begin
(

let uu____6898 = (FStar_TypeChecker_Rel.conj_guard g_e g_rest)
in (((((e), (imp)))::args), ((((e.FStar_Syntax_Syntax.pos), (c)))::comps), (uu____6898)))
end))
end))
end))
in (

let uu____6909 = (tc_args env args)
in (match (uu____6909) with
| (args, comps, g_args) -> begin
(

let bs = (

let uu____6931 = (FStar_All.pipe_right comps (FStar_List.map (fun uu____6951 -> (match (uu____6951) with
| (uu____6959, c) -> begin
((c.FStar_Syntax_Syntax.res_typ), (None))
end))))
in (FStar_Syntax_Util.null_binders_of_tks uu____6931))
in (

let ml_or_tot = (fun t r -> (

let uu____6975 = (FStar_Options.ml_ish ())
in (match (uu____6975) with
| true -> begin
(FStar_Syntax_Util.ml_comp t r)
end
| uu____6976 -> begin
(FStar_Syntax_Syntax.mk_Total t)
end)))
in (

let cres = (

let uu____6978 = (

let uu____6981 = (

let uu____6982 = (FStar_Syntax_Util.type_u ())
in (FStar_All.pipe_right uu____6982 Prims.fst))
in (FStar_TypeChecker_Util.new_uvar env uu____6981))
in (ml_or_tot uu____6978 r))
in (

let bs_cres = (FStar_Syntax_Util.arrow bs cres)
in ((

let uu____6991 = (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env) FStar_Options.Extreme)
in (match (uu____6991) with
| true -> begin
(

let uu____6992 = (FStar_Syntax_Print.term_to_string head)
in (

let uu____6993 = (FStar_Syntax_Print.term_to_string tf)
in (

let uu____6994 = (FStar_Syntax_Print.term_to_string bs_cres)
in (FStar_Util.print3 "Forcing the type of %s from %s to %s\n" uu____6992 uu____6993 uu____6994))))
end
| uu____6995 -> begin
()
end));
(

let uu____6997 = (FStar_TypeChecker_Rel.teq env tf bs_cres)
in (FStar_All.pipe_left (FStar_TypeChecker_Rel.force_trivial_guard env) uu____6997));
(

let comp = (

let uu____6999 = (FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp cres)
in (FStar_List.fold_right (fun uu____7004 out -> (match (uu____7004) with
| (r1, c) -> begin
(FStar_TypeChecker_Util.bind r1 env None c ((None), (out)))
end)) ((((head.FStar_Syntax_Syntax.pos), (chead)))::comps) uu____6999))
in (

let uu____7013 = ((FStar_Syntax_Syntax.mk_Tm_app head args) (Some (comp.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) r)
in (

let uu____7020 = (FStar_TypeChecker_Rel.conj_guard ghead g_args)
in ((uu____7013), (comp), (uu____7020)))));
)))))
end)))
end
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(

let uu____7035 = (FStar_Syntax_Subst.open_comp bs c)
in (match (uu____7035) with
| (bs, c) -> begin
(

let head_info = ((head), (chead), (ghead), ((FStar_Syntax_Util.lcomp_of_comp c)))
in (tc_args head_info (([]), ([]), ([]), (FStar_TypeChecker_Rel.trivial_guard), ([])) bs args))
end))
end
| uu____7078 -> begin
(match ((not (norm))) with
| true -> begin
(

let uu____7084 = (unfold_whnf env tf)
in (check_function_app true uu____7084))
end
| uu____7085 -> begin
(

let uu____7086 = (

let uu____7087 = (

let uu____7090 = (FStar_TypeChecker_Err.expected_function_typ env tf)
in ((uu____7090), (head.FStar_Syntax_Syntax.pos)))
in FStar_Errors.Error (uu____7087))
in (Prims.raise uu____7086))
end)
end)))
in (

let uu____7096 = (

let uu____7097 = (FStar_Syntax_Util.unrefine thead)
in (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.Beta)::(FStar_TypeChecker_Normalize.WHNF)::[]) env uu____7097))
in (check_function_app false uu____7096)))));
)))))
and check_short_circuit_args : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.lcomp  ->  FStar_TypeChecker_Env.guard_t  ->  ((FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.aqual) Prims.list  ->  FStar_Syntax_Syntax.typ Prims.option  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env head chead g_head args expected_topt -> (

let r = (FStar_TypeChecker_Env.get_range env)
in (

let tf = (FStar_Syntax_Subst.compress chead.FStar_Syntax_Syntax.res_typ)
in (match (tf.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_arrow (bs, c) when ((FStar_Syntax_Util.is_total_comp c) && ((FStar_List.length bs) = (FStar_List.length args))) -> begin
(

let res_t = (FStar_Syntax_Util.comp_result c)
in (

let uu____7143 = (FStar_List.fold_left2 (fun uu____7156 uu____7157 uu____7158 -> (match (((uu____7156), (uu____7157), (uu____7158))) with
| ((seen, guard, ghost), (e, aq), (b, aq')) -> begin
((match ((aq <> aq')) with
| true -> begin
(Prims.raise (FStar_Errors.Error ((("Inconsistent implicit qualifiers"), (e.FStar_Syntax_Syntax.pos)))))
end
| uu____7201 -> begin
()
end);
(

let uu____7202 = (tc_check_tot_or_gtot_term env e b.FStar_Syntax_Syntax.sort)
in (match (uu____7202) with
| (e, c, g) -> begin
(

let short = (FStar_TypeChecker_Util.short_circuit head seen)
in (

let g = (

let uu____7214 = (FStar_TypeChecker_Rel.guard_of_guard_formula short)
in (FStar_TypeChecker_Rel.imp_guard uu____7214 g))
in (

let ghost = (ghost || ((

let uu____7216 = (FStar_Syntax_Util.is_total_lcomp c)
in (not (uu____7216))) && (

let uu____7217 = (FStar_TypeChecker_Util.is_pure_effect env c.FStar_Syntax_Syntax.eff_name)
in (not (uu____7217)))))
in (

let uu____7218 = (

let uu____7224 = (

let uu____7230 = (FStar_Syntax_Syntax.as_arg e)
in (uu____7230)::[])
in (FStar_List.append seen uu____7224))
in (

let uu____7235 = (FStar_TypeChecker_Rel.conj_guard guard g)
in ((uu____7218), (uu____7235), (ghost)))))))
end));
)
end)) (([]), (g_head), (false)) args bs)
in (match (uu____7143) with
| (args, guard, ghost) -> begin
(

let e = ((FStar_Syntax_Syntax.mk_Tm_app head args) (Some (res_t.FStar_Syntax_Syntax.n)) r)
in (

let c = (match (ghost) with
| true -> begin
(

let uu____7264 = (FStar_Syntax_Syntax.mk_GTotal res_t)
in (FStar_All.pipe_right uu____7264 FStar_Syntax_Util.lcomp_of_comp))
end
| uu____7265 -> begin
(FStar_Syntax_Util.lcomp_of_comp c)
end)
in (

let uu____7266 = (FStar_TypeChecker_Util.strengthen_precondition None env e c guard)
in (match (uu____7266) with
| (c, g) -> begin
((e), (c), (g))
end))))
end)))
end
| uu____7278 -> begin
(check_application_args env head chead g_head args expected_topt)
end))))
and tc_eqn : FStar_Syntax_Syntax.bv  ->  FStar_TypeChecker_Env.env  ->  ((FStar_Syntax_Syntax.pat', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.withinfo_t * (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax Prims.option * (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax)  ->  ((FStar_Syntax_Syntax.pat * FStar_Syntax_Syntax.term Prims.option * FStar_Syntax_Syntax.term) * FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun scrutinee env branch -> (

let uu____7300 = (FStar_Syntax_Subst.open_branch branch)
in (match (uu____7300) with
| (pattern, when_clause, branch_exp) -> begin
(

let uu____7326 = branch
in (match (uu____7326) with
| (cpat, uu____7346, cbr) -> begin
(

let tc_pat = (fun allow_implicits pat_t p0 -> (

let uu____7388 = (FStar_TypeChecker_Util.pat_as_exps allow_implicits env p0)
in (match (uu____7388) with
| (pat_bvs, exps, p) -> begin
((

let uu____7410 = (FStar_TypeChecker_Env.debug env FStar_Options.High)
in (match (uu____7410) with
| true -> begin
(

let uu____7411 = (FStar_Syntax_Print.pat_to_string p0)
in (

let uu____7412 = (FStar_Syntax_Print.pat_to_string p)
in (FStar_Util.print2 "Pattern %s elaborated to %s\n" uu____7411 uu____7412)))
end
| uu____7413 -> begin
()
end));
(

let pat_env = (FStar_List.fold_left FStar_TypeChecker_Env.push_bv env pat_bvs)
in (

let uu____7415 = (FStar_TypeChecker_Env.clear_expected_typ pat_env)
in (match (uu____7415) with
| (env1, uu____7428) -> begin
(

let env1 = (

let uu___110_7432 = env1
in {FStar_TypeChecker_Env.solver = uu___110_7432.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___110_7432.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___110_7432.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___110_7432.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___110_7432.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___110_7432.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___110_7432.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___110_7432.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = true; FStar_TypeChecker_Env.instantiate_imp = uu___110_7432.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___110_7432.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___110_7432.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = uu___110_7432.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = uu___110_7432.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = uu___110_7432.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = uu___110_7432.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = uu___110_7432.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___110_7432.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = uu___110_7432.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = uu___110_7432.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___110_7432.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___110_7432.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = uu___110_7432.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = uu___110_7432.FStar_TypeChecker_Env.qname_and_index})
in (

let expected_pat_t = (FStar_TypeChecker_Rel.unrefine env pat_t)
in (

let uu____7434 = (

let uu____7439 = (FStar_All.pipe_right exps (FStar_List.map (fun e -> ((

let uu____7451 = (FStar_TypeChecker_Env.debug env FStar_Options.High)
in (match (uu____7451) with
| true -> begin
(

let uu____7452 = (FStar_Syntax_Print.term_to_string e)
in (

let uu____7453 = (FStar_Syntax_Print.term_to_string pat_t)
in (FStar_Util.print2 "Checking pattern expression %s against expected type %s\n" uu____7452 uu____7453)))
end
| uu____7454 -> begin
()
end));
(

let uu____7455 = (tc_term env1 e)
in (match (uu____7455) with
| (e, lc, g) -> begin
((

let uu____7465 = (FStar_TypeChecker_Env.debug env FStar_Options.High)
in (match (uu____7465) with
| true -> begin
(

let uu____7466 = (FStar_TypeChecker_Normalize.term_to_string env e)
in (

let uu____7467 = (FStar_TypeChecker_Normalize.term_to_string env lc.FStar_Syntax_Syntax.res_typ)
in (FStar_Util.print2 "Pre-checked pattern expression %s at type %s\n" uu____7466 uu____7467)))
end
| uu____7468 -> begin
()
end));
(

let g' = (FStar_TypeChecker_Rel.teq env lc.FStar_Syntax_Syntax.res_typ expected_pat_t)
in (

let g = (FStar_TypeChecker_Rel.conj_guard g g')
in (

let uu____7471 = (

let uu____7472 = (FStar_TypeChecker_Rel.discharge_guard env (

let uu___111_7473 = g
in {FStar_TypeChecker_Env.guard_f = FStar_TypeChecker_Common.Trivial; FStar_TypeChecker_Env.deferred = uu___111_7473.FStar_TypeChecker_Env.deferred; FStar_TypeChecker_Env.univ_ineqs = uu___111_7473.FStar_TypeChecker_Env.univ_ineqs; FStar_TypeChecker_Env.implicits = uu___111_7473.FStar_TypeChecker_Env.implicits}))
in (FStar_All.pipe_right uu____7472 FStar_TypeChecker_Rel.resolve_implicits))
in (

let e' = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.Beta)::[]) env e)
in (

let uvars_to_string = (fun uvs -> (

let uu____7487 = (

let uu____7489 = (FStar_All.pipe_right uvs FStar_Util.set_elements)
in (FStar_All.pipe_right uu____7489 (FStar_List.map (fun uu____7513 -> (match (uu____7513) with
| (u, uu____7518) -> begin
(FStar_Syntax_Print.uvar_to_string u)
end)))))
in (FStar_All.pipe_right uu____7487 (FStar_String.concat ", "))))
in (

let uvs1 = (FStar_Syntax_Free.uvars e')
in (

let uvs2 = (FStar_Syntax_Free.uvars expected_pat_t)
in ((

let uu____7531 = (

let uu____7532 = (FStar_Util.set_is_subset_of uvs1 uvs2)
in (FStar_All.pipe_left Prims.op_Negation uu____7532))
in (match (uu____7531) with
| true -> begin
(

let unresolved = (

let uu____7539 = (FStar_Util.set_difference uvs1 uvs2)
in (FStar_All.pipe_right uu____7539 FStar_Util.set_elements))
in (

let uu____7553 = (

let uu____7554 = (

let uu____7557 = (

let uu____7558 = (FStar_TypeChecker_Normalize.term_to_string env e')
in (

let uu____7559 = (FStar_TypeChecker_Normalize.term_to_string env expected_pat_t)
in (

let uu____7560 = (

let uu____7561 = (FStar_All.pipe_right unresolved (FStar_List.map (fun uu____7573 -> (match (uu____7573) with
| (u, uu____7581) -> begin
(FStar_Syntax_Print.uvar_to_string u)
end))))
in (FStar_All.pipe_right uu____7561 (FStar_String.concat ", ")))
in (FStar_Util.format3 "Implicit pattern variables in %s could not be resolved against expected type %s;Variables {%s} were unresolved; please bind them explicitly" uu____7558 uu____7559 uu____7560))))
in ((uu____7557), (p.FStar_Syntax_Syntax.p)))
in FStar_Errors.Error (uu____7554))
in (Prims.raise uu____7553)))
end
| uu____7594 -> begin
()
end));
(

let uu____7596 = (FStar_TypeChecker_Env.debug env FStar_Options.High)
in (match (uu____7596) with
| true -> begin
(

let uu____7597 = (FStar_TypeChecker_Normalize.term_to_string env e)
in (FStar_Util.print1 "Done checking pattern expression %s\n" uu____7597))
end
| uu____7598 -> begin
()
end));
((e), (e'));
))))))));
)
end));
))))
in (FStar_All.pipe_right uu____7439 FStar_List.unzip))
in (match (uu____7434) with
| (exps, norm_exps) -> begin
(

let p = (FStar_TypeChecker_Util.decorate_pattern env p exps)
in ((p), (pat_bvs), (pat_env), (exps), (norm_exps)))
end))))
end)));
)
end)))
in (

let pat_t = scrutinee.FStar_Syntax_Syntax.sort
in (

let scrutinee_tm = (FStar_Syntax_Syntax.bv_to_name scrutinee)
in (

let uu____7628 = (

let uu____7632 = (FStar_TypeChecker_Env.push_bv env scrutinee)
in (FStar_All.pipe_right uu____7632 FStar_TypeChecker_Env.clear_expected_typ))
in (match (uu____7628) with
| (scrutinee_env, uu____7645) -> begin
(

let uu____7648 = (tc_pat true pat_t pattern)
in (match (uu____7648) with
| (pattern, pat_bvs, pat_env, disj_exps, norm_disj_exps) -> begin
(

let uu____7676 = (match (when_clause) with
| None -> begin
((None), (FStar_TypeChecker_Rel.trivial_guard))
end
| Some (e) -> begin
(

let uu____7691 = (FStar_TypeChecker_Env.should_verify env)
in (match (uu____7691) with
| true -> begin
(Prims.raise (FStar_Errors.Error ((("When clauses are not yet supported in --verify mode; they will be some day"), (e.FStar_Syntax_Syntax.pos)))))
end
| uu____7698 -> begin
(

let uu____7699 = (

let uu____7703 = (FStar_TypeChecker_Env.set_expected_typ pat_env FStar_TypeChecker_Common.t_bool)
in (tc_term uu____7703 e))
in (match (uu____7699) with
| (e, c, g) -> begin
((Some (e)), (g))
end))
end))
end)
in (match (uu____7676) with
| (when_clause, g_when) -> begin
(

let uu____7723 = (tc_term pat_env branch_exp)
in (match (uu____7723) with
| (branch_exp, c, g_branch) -> begin
(

let when_condition = (match (when_clause) with
| None -> begin
None
end
| Some (w) -> begin
(

let uu____7742 = (FStar_Syntax_Util.mk_eq2 FStar_Syntax_Syntax.U_zero FStar_Syntax_Util.t_bool w FStar_Syntax_Const.exp_true_bool)
in (FStar_All.pipe_left (fun _0_30 -> Some (_0_30)) uu____7742))
end)
in (

let uu____7744 = (

let eqs = (

let uu____7750 = (

let uu____7751 = (FStar_TypeChecker_Env.should_verify env)
in (not (uu____7751)))
in (match (uu____7750) with
| true -> begin
None
end
| uu____7753 -> begin
(FStar_All.pipe_right disj_exps (FStar_List.fold_left (fun fopt e -> (

let e = (FStar_Syntax_Subst.compress e)
in (match (e.FStar_Syntax_Syntax.n) with
| (FStar_Syntax_Syntax.Tm_uvar (_)) | (FStar_Syntax_Syntax.Tm_constant (_)) | (FStar_Syntax_Syntax.Tm_fvar (_)) -> begin
fopt
end
| uu____7765 -> begin
(

let clause = (

let uu____7767 = (env.FStar_TypeChecker_Env.universe_of env pat_t)
in (FStar_Syntax_Util.mk_eq2 uu____7767 pat_t scrutinee_tm e))
in (match (fopt) with
| None -> begin
Some (clause)
end
| Some (f) -> begin
(

let uu____7770 = (FStar_Syntax_Util.mk_disj clause f)
in (FStar_All.pipe_left (fun _0_31 -> Some (_0_31)) uu____7770))
end))
end))) None))
end))
in (

let uu____7780 = (FStar_TypeChecker_Util.strengthen_precondition None env branch_exp c g_branch)
in (match (uu____7780) with
| (c, g_branch) -> begin
(

let uu____7790 = (match (((eqs), (when_condition))) with
| uu____7797 when (

let uu____7802 = (FStar_TypeChecker_Env.should_verify env)
in (not (uu____7802))) -> begin
((c), (g_when))
end
| (None, None) -> begin
((c), (g_when))
end
| (Some (f), None) -> begin
(

let gf = FStar_TypeChecker_Common.NonTrivial (f)
in (

let g = (FStar_TypeChecker_Rel.guard_of_guard_formula gf)
in (

let uu____7810 = (FStar_TypeChecker_Util.weaken_precondition env c gf)
in (

let uu____7811 = (FStar_TypeChecker_Rel.imp_guard g g_when)
in ((uu____7810), (uu____7811))))))
end
| (Some (f), Some (w)) -> begin
(

let g_f = FStar_TypeChecker_Common.NonTrivial (f)
in (

let g_fw = (

let uu____7818 = (FStar_Syntax_Util.mk_conj f w)
in FStar_TypeChecker_Common.NonTrivial (uu____7818))
in (

let uu____7819 = (FStar_TypeChecker_Util.weaken_precondition env c g_fw)
in (

let uu____7820 = (

let uu____7821 = (FStar_TypeChecker_Rel.guard_of_guard_formula g_f)
in (FStar_TypeChecker_Rel.imp_guard uu____7821 g_when))
in ((uu____7819), (uu____7820))))))
end
| (None, Some (w)) -> begin
(

let g_w = FStar_TypeChecker_Common.NonTrivial (w)
in (

let g = (FStar_TypeChecker_Rel.guard_of_guard_formula g_w)
in (

let uu____7827 = (FStar_TypeChecker_Util.weaken_precondition env c g_w)
in ((uu____7827), (g_when)))))
end)
in (match (uu____7790) with
| (c_weak, g_when_weak) -> begin
(

let binders = (FStar_List.map FStar_Syntax_Syntax.mk_binder pat_bvs)
in (

let uu____7835 = (FStar_TypeChecker_Util.close_comp env pat_bvs c_weak)
in (

let uu____7836 = (FStar_TypeChecker_Rel.close_guard binders g_when_weak)
in ((uu____7835), (uu____7836), (g_branch)))))
end))
end)))
in (match (uu____7744) with
| (c, g_when, g_branch) -> begin
(

let branch_guard = (

let uu____7849 = (

let uu____7850 = (FStar_TypeChecker_Env.should_verify env)
in (not (uu____7850)))
in (match (uu____7849) with
| true -> begin
FStar_Syntax_Util.t_true
end
| uu____7851 -> begin
(

let rec build_branch_guard = (fun scrutinee_tm pat_exp -> (

let discriminate = (fun scrutinee_tm f -> (

let uu____7881 = (

let uu____7882 = (

let uu____7883 = (

let uu____7885 = (

let uu____7889 = (FStar_TypeChecker_Env.typ_of_datacon env f.FStar_Syntax_Syntax.v)
in (FStar_TypeChecker_Env.datacons_of_typ env uu____7889))
in (Prims.snd uu____7885))
in (FStar_List.length uu____7883))
in (uu____7882 > (Prims.parse_int "1")))
in (match (uu____7881) with
| true -> begin
(

let discriminator = (FStar_Syntax_Util.mk_discriminator f.FStar_Syntax_Syntax.v)
in (

let uu____7898 = (FStar_TypeChecker_Env.try_lookup_lid env discriminator)
in (match (uu____7898) with
| None -> begin
[]
end
| uu____7905 -> begin
(

let disc = (FStar_Syntax_Syntax.fvar discriminator FStar_Syntax_Syntax.Delta_equational None)
in (

let disc = (

let uu____7913 = (

let uu____7914 = (

let uu____7915 = (FStar_Syntax_Syntax.as_arg scrutinee_tm)
in (uu____7915)::[])
in (FStar_Syntax_Syntax.mk_Tm_app disc uu____7914))
in (uu____7913 None scrutinee_tm.FStar_Syntax_Syntax.pos))
in (

let uu____7920 = (FStar_Syntax_Util.mk_eq2 FStar_Syntax_Syntax.U_zero FStar_Syntax_Util.t_bool disc FStar_Syntax_Const.exp_true_bool)
in (uu____7920)::[])))
end)))
end
| uu____7921 -> begin
[]
end)))
in (

let fail = (fun uu____7928 -> (

let uu____7929 = (

let uu____7930 = (FStar_Range.string_of_range pat_exp.FStar_Syntax_Syntax.pos)
in (

let uu____7931 = (FStar_Syntax_Print.term_to_string pat_exp)
in (

let uu____7932 = (FStar_Syntax_Print.tag_of_term pat_exp)
in (FStar_Util.format3 "tc_eqn: Impossible (%s) %s (%s)" uu____7930 uu____7931 uu____7932))))
in (failwith uu____7929)))
in (

let rec head_constructor = (fun t -> (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
fv.FStar_Syntax_Syntax.fv_name
end
| FStar_Syntax_Syntax.Tm_uinst (t, uu____7953) -> begin
(head_constructor t)
end
| uu____7959 -> begin
(fail ())
end))
in (

let pat_exp = (

let uu____7962 = (FStar_Syntax_Subst.compress pat_exp)
in (FStar_All.pipe_right uu____7962 FStar_Syntax_Util.unmeta))
in (match (pat_exp.FStar_Syntax_Syntax.n) with
| (FStar_Syntax_Syntax.Tm_uvar (_)) | (FStar_Syntax_Syntax.Tm_app ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uvar (_); FStar_Syntax_Syntax.tk = _; FStar_Syntax_Syntax.pos = _; FStar_Syntax_Syntax.vars = _}, _)) | (FStar_Syntax_Syntax.Tm_name (_)) | (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_unit)) -> begin
[]
end
| FStar_Syntax_Syntax.Tm_constant (c) -> begin
(

let uu____7979 = (

let uu____7980 = (tc_constant pat_exp.FStar_Syntax_Syntax.pos c)
in (FStar_Syntax_Util.mk_eq2 FStar_Syntax_Syntax.U_zero uu____7980 scrutinee_tm pat_exp))
in (uu____7979)::[])
end
| (FStar_Syntax_Syntax.Tm_uinst (_)) | (FStar_Syntax_Syntax.Tm_fvar (_)) -> begin
(

let f = (head_constructor pat_exp)
in (

let uu____7988 = (

let uu____7989 = (FStar_TypeChecker_Env.is_datacon env f.FStar_Syntax_Syntax.v)
in (not (uu____7989)))
in (match (uu____7988) with
| true -> begin
[]
end
| uu____7995 -> begin
(

let uu____7996 = (head_constructor pat_exp)
in (discriminate scrutinee_tm uu____7996))
end)))
end
| FStar_Syntax_Syntax.Tm_app (head, args) -> begin
(

let f = (head_constructor head)
in (

let uu____8023 = (

let uu____8024 = (FStar_TypeChecker_Env.is_datacon env f.FStar_Syntax_Syntax.v)
in (not (uu____8024)))
in (match (uu____8023) with
| true -> begin
[]
end
| uu____8030 -> begin
(

let sub_term_guards = (

let uu____8033 = (FStar_All.pipe_right args (FStar_List.mapi (fun i uu____8049 -> (match (uu____8049) with
| (ei, uu____8056) -> begin
(

let projector = (FStar_TypeChecker_Env.lookup_projector env f.FStar_Syntax_Syntax.v i)
in (

let uu____8066 = (FStar_TypeChecker_Env.try_lookup_lid env projector)
in (match (uu____8066) with
| None -> begin
[]
end
| uu____8073 -> begin
(

let sub_term = (

let uu____8080 = (

let uu____8081 = (FStar_Syntax_Syntax.fvar (FStar_Ident.set_lid_range projector f.FStar_Syntax_Syntax.p) FStar_Syntax_Syntax.Delta_equational None)
in (

let uu____8086 = (

let uu____8087 = (FStar_Syntax_Syntax.as_arg scrutinee_tm)
in (uu____8087)::[])
in (FStar_Syntax_Syntax.mk_Tm_app uu____8081 uu____8086)))
in (uu____8080 None f.FStar_Syntax_Syntax.p))
in (build_branch_guard sub_term ei))
end)))
end))))
in (FStar_All.pipe_right uu____8033 FStar_List.flatten))
in (

let uu____8099 = (discriminate scrutinee_tm f)
in (FStar_List.append uu____8099 sub_term_guards)))
end)))
end
| uu____8103 -> begin
[]
end))))))
in (

let build_and_check_branch_guard = (fun scrutinee_tm pat -> (

let uu____8115 = (

let uu____8116 = (FStar_TypeChecker_Env.should_verify env)
in (not (uu____8116)))
in (match (uu____8115) with
| true -> begin
(FStar_TypeChecker_Util.fvar_const env FStar_Syntax_Const.true_lid)
end
| uu____8117 -> begin
(

let t = (

let uu____8119 = (build_branch_guard scrutinee_tm pat)
in (FStar_All.pipe_left FStar_Syntax_Util.mk_conj_l uu____8119))
in (

let uu____8122 = (FStar_Syntax_Util.type_u ())
in (match (uu____8122) with
| (k, uu____8126) -> begin
(

let uu____8127 = (tc_check_tot_or_gtot_term scrutinee_env t k)
in (match (uu____8127) with
| (t, uu____8132, uu____8133) -> begin
t
end))
end)))
end)))
in (

let branch_guard = (

let uu____8135 = (FStar_All.pipe_right norm_disj_exps (FStar_List.map (build_and_check_branch_guard scrutinee_tm)))
in (FStar_All.pipe_right uu____8135 FStar_Syntax_Util.mk_disj_l))
in (

let branch_guard = (match (when_condition) with
| None -> begin
branch_guard
end
| Some (w) -> begin
(FStar_Syntax_Util.mk_conj branch_guard w)
end)
in branch_guard))))
end))
in (

let guard = (FStar_TypeChecker_Rel.conj_guard g_when g_branch)
in ((

let uu____8146 = (FStar_TypeChecker_Env.debug env FStar_Options.High)
in (match (uu____8146) with
| true -> begin
(

let uu____8147 = (FStar_TypeChecker_Rel.guard_to_string env guard)
in (FStar_All.pipe_left (FStar_Util.print1 "Carrying guard from match: %s\n") uu____8147))
end
| uu____8148 -> begin
()
end));
(

let uu____8149 = (FStar_Syntax_Subst.close_branch ((pattern), (when_clause), (branch_exp)))
in ((uu____8149), (branch_guard), (c), (guard)));
)))
end)))
end))
end))
end))
end)))))
end))
end)))
and check_top_level_let : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env e -> (

let env = (instantiate_both env)
in (match (e.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_let ((false, (lb)::[]), e2) -> begin
(

let uu____8167 = (check_let_bound_def true env lb)
in (match (uu____8167) with
| (e1, univ_vars, c1, g1, annotated) -> begin
(

let uu____8181 = (match ((annotated && (not (env.FStar_TypeChecker_Env.generalize)))) with
| true -> begin
((g1), (e1), (univ_vars), (c1))
end
| uu____8190 -> begin
(

let g1 = (

let uu____8192 = (FStar_TypeChecker_Rel.solve_deferred_constraints env g1)
in (FStar_All.pipe_right uu____8192 FStar_TypeChecker_Rel.resolve_implicits))
in (

let uu____8194 = (

let uu____8199 = (

let uu____8205 = (

let uu____8210 = (

let uu____8218 = (c1.FStar_Syntax_Syntax.comp ())
in ((lb.FStar_Syntax_Syntax.lbname), (e1), (uu____8218)))
in (uu____8210)::[])
in (FStar_TypeChecker_Util.generalize env uu____8205))
in (FStar_List.hd uu____8199))
in (match (uu____8194) with
| (uu____8247, univs, e1, c1) -> begin
((g1), (e1), (univs), ((FStar_Syntax_Util.lcomp_of_comp c1)))
end)))
end)
in (match (uu____8181) with
| (g1, e1, univ_vars, c1) -> begin
(

let uu____8258 = (

let uu____8263 = (FStar_TypeChecker_Env.should_verify env)
in (match (uu____8263) with
| true -> begin
(

let uu____8268 = (FStar_TypeChecker_Util.check_top_level env g1 c1)
in (match (uu____8268) with
| (ok, c1) -> begin
(match (ok) with
| true -> begin
((e2), (c1))
end
| uu____8283 -> begin
((

let uu____8285 = (FStar_Options.warn_top_level_effects ())
in (match (uu____8285) with
| true -> begin
(

let uu____8286 = (FStar_TypeChecker_Env.get_range env)
in (FStar_Errors.warn uu____8286 FStar_TypeChecker_Err.top_level_effect))
end
| uu____8287 -> begin
()
end));
(

let uu____8288 = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_meta (((e2), (FStar_Syntax_Syntax.Meta_desugared (FStar_Syntax_Syntax.Masked_effect)))))) None e2.FStar_Syntax_Syntax.pos)
in ((uu____8288), (c1)));
)
end)
end))
end
| uu____8303 -> begin
((FStar_TypeChecker_Rel.force_trivial_guard env g1);
(

let c = (

let uu____8306 = (c1.FStar_Syntax_Syntax.comp ())
in (FStar_All.pipe_right uu____8306 (FStar_TypeChecker_Normalize.normalize_comp ((FStar_TypeChecker_Normalize.Beta)::[]) env)))
in (

let e2 = (

let uu____8314 = (FStar_Syntax_Util.is_pure_comp c)
in (match (uu____8314) with
| true -> begin
e2
end
| uu____8317 -> begin
((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_meta (((e2), (FStar_Syntax_Syntax.Meta_desugared (FStar_Syntax_Syntax.Masked_effect)))))) None e2.FStar_Syntax_Syntax.pos)
end))
in ((e2), (c))));
)
end))
in (match (uu____8258) with
| (e2, c1) -> begin
(

let cres = (FStar_TypeChecker_Env.null_wp_for_eff env (FStar_Syntax_Util.comp_effect_name c1) FStar_Syntax_Syntax.U_zero FStar_TypeChecker_Common.t_unit)
in ((FStar_ST.write e2.FStar_Syntax_Syntax.tk (Some (FStar_TypeChecker_Common.t_unit.FStar_Syntax_Syntax.n)));
(

let lb = (FStar_Syntax_Util.close_univs_and_mk_letbinding None lb.FStar_Syntax_Syntax.lbname univ_vars (FStar_Syntax_Util.comp_result c1) (FStar_Syntax_Util.comp_effect_name c1) e1)
in (

let uu____8346 = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_let (((((false), ((lb)::[]))), (e2))))) (Some (FStar_TypeChecker_Common.t_unit.FStar_Syntax_Syntax.n)) e.FStar_Syntax_Syntax.pos)
in ((uu____8346), ((FStar_Syntax_Util.lcomp_of_comp cres)), (FStar_TypeChecker_Rel.trivial_guard))));
))
end))
end))
end))
end
| uu____8365 -> begin
(failwith "Impossible")
end)))
and check_inner_let : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env e -> (

let env = (instantiate_both env)
in (match (e.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_let ((false, (lb)::[]), e2) -> begin
(

let env = (

let uu___112_8386 = env
in {FStar_TypeChecker_Env.solver = uu___112_8386.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___112_8386.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___112_8386.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___112_8386.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___112_8386.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___112_8386.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___112_8386.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___112_8386.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___112_8386.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = uu___112_8386.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___112_8386.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___112_8386.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = uu___112_8386.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = false; FStar_TypeChecker_Env.check_uvars = uu___112_8386.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = uu___112_8386.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = uu___112_8386.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___112_8386.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = uu___112_8386.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = uu___112_8386.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___112_8386.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___112_8386.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = uu___112_8386.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = uu___112_8386.FStar_TypeChecker_Env.qname_and_index})
in (

let uu____8387 = (

let uu____8393 = (

let uu____8394 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (FStar_All.pipe_right uu____8394 Prims.fst))
in (check_let_bound_def false uu____8393 lb))
in (match (uu____8387) with
| (e1, uu____8406, c1, g1, annotated) -> begin
(

let x = (

let uu___113_8411 = (FStar_Util.left lb.FStar_Syntax_Syntax.lbname)
in {FStar_Syntax_Syntax.ppname = uu___113_8411.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___113_8411.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = c1.FStar_Syntax_Syntax.res_typ})
in (

let uu____8412 = (

let uu____8415 = (

let uu____8416 = (FStar_Syntax_Syntax.mk_binder x)
in (uu____8416)::[])
in (FStar_Syntax_Subst.open_term uu____8415 e2))
in (match (uu____8412) with
| (xb, e2) -> begin
(

let xbinder = (FStar_List.hd xb)
in (

let x = (Prims.fst xbinder)
in (

let uu____8428 = (

let uu____8432 = (FStar_TypeChecker_Env.push_bv env x)
in (tc_term uu____8432 e2))
in (match (uu____8428) with
| (e2, c2, g2) -> begin
(

let cres = (FStar_TypeChecker_Util.bind e1.FStar_Syntax_Syntax.pos env (Some (e1)) c1 ((Some (x)), (c2)))
in (

let e1 = (FStar_TypeChecker_Util.maybe_lift env e1 c1.FStar_Syntax_Syntax.eff_name cres.FStar_Syntax_Syntax.eff_name c1.FStar_Syntax_Syntax.res_typ)
in (

let e2 = (FStar_TypeChecker_Util.maybe_lift env e2 c2.FStar_Syntax_Syntax.eff_name cres.FStar_Syntax_Syntax.eff_name c2.FStar_Syntax_Syntax.res_typ)
in (

let lb = (FStar_Syntax_Util.mk_letbinding (FStar_Util.Inl (x)) [] c1.FStar_Syntax_Syntax.res_typ c1.FStar_Syntax_Syntax.eff_name e1)
in (

let e = (

let uu____8447 = (

let uu____8450 = (

let uu____8451 = (

let uu____8459 = (FStar_Syntax_Subst.close xb e2)
in ((((false), ((lb)::[]))), (uu____8459)))
in FStar_Syntax_Syntax.Tm_let (uu____8451))
in (FStar_Syntax_Syntax.mk uu____8450))
in (uu____8447 (Some (cres.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)) e.FStar_Syntax_Syntax.pos))
in (

let e = (FStar_TypeChecker_Util.maybe_monadic env e cres.FStar_Syntax_Syntax.eff_name cres.FStar_Syntax_Syntax.res_typ)
in (

let x_eq_e1 = (

let uu____8474 = (

let uu____8475 = (env.FStar_TypeChecker_Env.universe_of env c1.FStar_Syntax_Syntax.res_typ)
in (

let uu____8476 = (FStar_Syntax_Syntax.bv_to_name x)
in (FStar_Syntax_Util.mk_eq2 uu____8475 c1.FStar_Syntax_Syntax.res_typ uu____8476 e1)))
in (FStar_All.pipe_left (fun _0_32 -> FStar_TypeChecker_Common.NonTrivial (_0_32)) uu____8474))
in (

let g2 = (

let uu____8478 = (

let uu____8479 = (FStar_TypeChecker_Rel.guard_of_guard_formula x_eq_e1)
in (FStar_TypeChecker_Rel.imp_guard uu____8479 g2))
in (FStar_TypeChecker_Rel.close_guard xb uu____8478))
in (

let guard = (FStar_TypeChecker_Rel.conj_guard g1 g2)
in (

let uu____8481 = (

let uu____8482 = (FStar_TypeChecker_Env.expected_typ env)
in (FStar_Option.isSome uu____8482))
in (match (uu____8481) with
| true -> begin
(

let tt = (

let uu____8488 = (FStar_TypeChecker_Env.expected_typ env)
in (FStar_All.pipe_right uu____8488 FStar_Option.get))
in ((

let uu____8492 = (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env) (FStar_Options.Other ("Exports")))
in (match (uu____8492) with
| true -> begin
(

let uu____8493 = (FStar_Syntax_Print.term_to_string tt)
in (

let uu____8494 = (FStar_Syntax_Print.term_to_string cres.FStar_Syntax_Syntax.res_typ)
in (FStar_Util.print2 "Got expected type from env %s\ncres.res_typ=%s\n" uu____8493 uu____8494)))
end
| uu____8495 -> begin
()
end));
((e), (cres), (guard));
))
end
| uu____8496 -> begin
(

let t = (check_no_escape None env ((x)::[]) cres.FStar_Syntax_Syntax.res_typ)
in ((

let uu____8499 = (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env) (FStar_Options.Other ("Exports")))
in (match (uu____8499) with
| true -> begin
(

let uu____8500 = (FStar_Syntax_Print.term_to_string cres.FStar_Syntax_Syntax.res_typ)
in (

let uu____8501 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print2 "Checked %s has no escaping types; normalized to %s\n" uu____8500 uu____8501)))
end
| uu____8502 -> begin
()
end));
((e), ((

let uu___114_8503 = cres
in {FStar_Syntax_Syntax.eff_name = uu___114_8503.FStar_Syntax_Syntax.eff_name; FStar_Syntax_Syntax.res_typ = t; FStar_Syntax_Syntax.cflags = uu___114_8503.FStar_Syntax_Syntax.cflags; FStar_Syntax_Syntax.comp = uu___114_8503.FStar_Syntax_Syntax.comp})), (guard));
))
end)))))))))))
end))))
end)))
end)))
end
| uu____8504 -> begin
(failwith "Impossible")
end)))
and check_top_level_let_rec : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env top -> (

let env = (instantiate_both env)
in (match (top.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_let ((true, lbs), e2) -> begin
(

let uu____8525 = (FStar_Syntax_Subst.open_let_rec lbs e2)
in (match (uu____8525) with
| (lbs, e2) -> begin
(

let uu____8536 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (uu____8536) with
| (env0, topt) -> begin
(

let uu____8547 = (build_let_rec_env true env0 lbs)
in (match (uu____8547) with
| (lbs, rec_env) -> begin
(

let uu____8558 = (check_let_recs rec_env lbs)
in (match (uu____8558) with
| (lbs, g_lbs) -> begin
(

let g_lbs = (

let uu____8570 = (FStar_TypeChecker_Rel.solve_deferred_constraints env g_lbs)
in (FStar_All.pipe_right uu____8570 FStar_TypeChecker_Rel.resolve_implicits))
in (

let all_lb_names = (

let uu____8574 = (FStar_All.pipe_right lbs (FStar_List.map (fun lb -> (FStar_Util.right lb.FStar_Syntax_Syntax.lbname))))
in (FStar_All.pipe_right uu____8574 (fun _0_33 -> Some (_0_33))))
in (

let lbs = (match ((not (env.FStar_TypeChecker_Env.generalize))) with
| true -> begin
(FStar_All.pipe_right lbs (FStar_List.map (fun lb -> (match ((lb.FStar_Syntax_Syntax.lbunivs = [])) with
| true -> begin
lb
end
| uu____8590 -> begin
(FStar_Syntax_Util.close_univs_and_mk_letbinding all_lb_names lb.FStar_Syntax_Syntax.lbname lb.FStar_Syntax_Syntax.lbunivs lb.FStar_Syntax_Syntax.lbtyp lb.FStar_Syntax_Syntax.lbeff lb.FStar_Syntax_Syntax.lbdef)
end))))
end
| uu____8591 -> begin
(

let ecs = (

let uu____8598 = (FStar_All.pipe_right lbs (FStar_List.map (fun lb -> (

let uu____8620 = (FStar_Syntax_Syntax.mk_Total lb.FStar_Syntax_Syntax.lbtyp)
in ((lb.FStar_Syntax_Syntax.lbname), (lb.FStar_Syntax_Syntax.lbdef), (uu____8620))))))
in (FStar_TypeChecker_Util.generalize env uu____8598))
in (FStar_All.pipe_right ecs (FStar_List.map (fun uu____8640 -> (match (uu____8640) with
| (x, uvs, e, c) -> begin
(FStar_Syntax_Util.close_univs_and_mk_letbinding all_lb_names x uvs (FStar_Syntax_Util.comp_result c) (FStar_Syntax_Util.comp_effect_name c) e)
end)))))
end)
in (

let cres = (

let uu____8665 = (FStar_Syntax_Syntax.mk_Total FStar_TypeChecker_Common.t_unit)
in (FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp uu____8665))
in ((FStar_ST.write e2.FStar_Syntax_Syntax.tk (Some (FStar_TypeChecker_Common.t_unit.FStar_Syntax_Syntax.n)));
(

let uu____8674 = (FStar_Syntax_Subst.close_let_rec lbs e2)
in (match (uu____8674) with
| (lbs, e2) -> begin
(

let uu____8685 = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_let (((((true), (lbs))), (e2))))) (Some (FStar_TypeChecker_Common.t_unit.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in (

let uu____8700 = (FStar_TypeChecker_Rel.discharge_guard env g_lbs)
in ((uu____8685), (cres), (uu____8700))))
end));
)))))
end))
end))
end))
end))
end
| uu____8703 -> begin
(failwith "Impossible")
end)))
and check_inner_let_rec : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env top -> (

let env = (instantiate_both env)
in (match (top.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_let ((true, lbs), e2) -> begin
(

let uu____8724 = (FStar_Syntax_Subst.open_let_rec lbs e2)
in (match (uu____8724) with
| (lbs, e2) -> begin
(

let uu____8735 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (uu____8735) with
| (env0, topt) -> begin
(

let uu____8746 = (build_let_rec_env false env0 lbs)
in (match (uu____8746) with
| (lbs, rec_env) -> begin
(

let uu____8757 = (check_let_recs rec_env lbs)
in (match (uu____8757) with
| (lbs, g_lbs) -> begin
(

let uu____8768 = (FStar_All.pipe_right lbs (FStar_Util.fold_map (fun env lb -> (

let x = (

let uu___115_8779 = (FStar_Util.left lb.FStar_Syntax_Syntax.lbname)
in {FStar_Syntax_Syntax.ppname = uu___115_8779.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___115_8779.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = lb.FStar_Syntax_Syntax.lbtyp})
in (

let lb = (

let uu___116_8781 = lb
in {FStar_Syntax_Syntax.lbname = FStar_Util.Inl (x); FStar_Syntax_Syntax.lbunivs = uu___116_8781.FStar_Syntax_Syntax.lbunivs; FStar_Syntax_Syntax.lbtyp = uu___116_8781.FStar_Syntax_Syntax.lbtyp; FStar_Syntax_Syntax.lbeff = uu___116_8781.FStar_Syntax_Syntax.lbeff; FStar_Syntax_Syntax.lbdef = uu___116_8781.FStar_Syntax_Syntax.lbdef})
in (

let env = (FStar_TypeChecker_Env.push_let_binding env lb.FStar_Syntax_Syntax.lbname (([]), (lb.FStar_Syntax_Syntax.lbtyp)))
in ((env), (lb)))))) env))
in (match (uu____8768) with
| (env, lbs) -> begin
(

let bvs = (FStar_All.pipe_right lbs (FStar_List.map (fun lb -> (FStar_Util.left lb.FStar_Syntax_Syntax.lbname))))
in (

let uu____8798 = (tc_term env e2)
in (match (uu____8798) with
| (e2, cres, g2) -> begin
(

let guard = (

let uu____8809 = (

let uu____8810 = (FStar_List.map FStar_Syntax_Syntax.mk_binder bvs)
in (FStar_TypeChecker_Rel.close_guard uu____8810 g2))
in (FStar_TypeChecker_Rel.conj_guard g_lbs uu____8809))
in (

let cres = (FStar_TypeChecker_Util.close_comp env bvs cres)
in (

let tres = (norm env cres.FStar_Syntax_Syntax.res_typ)
in (

let cres = (

let uu___117_8814 = cres
in {FStar_Syntax_Syntax.eff_name = uu___117_8814.FStar_Syntax_Syntax.eff_name; FStar_Syntax_Syntax.res_typ = tres; FStar_Syntax_Syntax.cflags = uu___117_8814.FStar_Syntax_Syntax.cflags; FStar_Syntax_Syntax.comp = uu___117_8814.FStar_Syntax_Syntax.comp})
in (

let uu____8815 = (FStar_Syntax_Subst.close_let_rec lbs e2)
in (match (uu____8815) with
| (lbs, e2) -> begin
(

let e = ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_let (((((true), (lbs))), (e2))))) (Some (tres.FStar_Syntax_Syntax.n)) top.FStar_Syntax_Syntax.pos)
in (match (topt) with
| Some (uu____8844) -> begin
((e), (cres), (guard))
end
| None -> begin
(

let tres = (check_no_escape None env bvs tres)
in (

let cres = (

let uu___118_8849 = cres
in {FStar_Syntax_Syntax.eff_name = uu___118_8849.FStar_Syntax_Syntax.eff_name; FStar_Syntax_Syntax.res_typ = tres; FStar_Syntax_Syntax.cflags = uu___118_8849.FStar_Syntax_Syntax.cflags; FStar_Syntax_Syntax.comp = uu___118_8849.FStar_Syntax_Syntax.comp})
in ((e), (cres), (guard))))
end))
end))))))
end)))
end))
end))
end))
end))
end))
end
| uu____8852 -> begin
(failwith "Impossible")
end)))
and build_let_rec_env : Prims.bool  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.letbinding Prims.list  ->  (FStar_Syntax_Syntax.letbinding Prims.list * FStar_TypeChecker_Env.env_t) = (fun top_level env lbs -> (

let env0 = env
in (

let termination_check_enabled = (fun t -> (

let uu____8868 = (FStar_Syntax_Util.arrow_formals_comp t)
in (match (uu____8868) with
| (uu____8874, c) -> begin
(

let quals = (FStar_TypeChecker_Env.lookup_effect_quals env (FStar_Syntax_Util.comp_effect_name c))
in (FStar_All.pipe_right quals (FStar_List.contains FStar_Syntax_Syntax.TotalEffect)))
end)))
in (

let uu____8885 = (FStar_List.fold_left (fun uu____8892 lb -> (match (uu____8892) with
| (lbs, env) -> begin
(

let uu____8904 = (FStar_TypeChecker_Util.extract_let_rec_annotation env lb)
in (match (uu____8904) with
| (univ_vars, t, check_t) -> begin
(

let env = (FStar_TypeChecker_Env.push_univ_vars env univ_vars)
in (

let e = (FStar_Syntax_Util.unascribe lb.FStar_Syntax_Syntax.lbdef)
in (

let t = (match ((not (check_t))) with
| true -> begin
t
end
| uu____8917 -> begin
(

let uu____8918 = (

let uu____8922 = (

let uu____8923 = (FStar_Syntax_Util.type_u ())
in (FStar_All.pipe_left Prims.fst uu____8923))
in (tc_check_tot_or_gtot_term (

let uu___119_8928 = env0
in {FStar_TypeChecker_Env.solver = uu___119_8928.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___119_8928.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___119_8928.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___119_8928.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___119_8928.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___119_8928.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___119_8928.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___119_8928.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___119_8928.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = uu___119_8928.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___119_8928.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___119_8928.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = uu___119_8928.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = uu___119_8928.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = true; FStar_TypeChecker_Env.use_eq = uu___119_8928.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = uu___119_8928.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___119_8928.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = uu___119_8928.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = uu___119_8928.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___119_8928.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___119_8928.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = uu___119_8928.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = uu___119_8928.FStar_TypeChecker_Env.qname_and_index}) t uu____8922))
in (match (uu____8918) with
| (t, uu____8930, g) -> begin
(

let g = (FStar_TypeChecker_Rel.resolve_implicits g)
in ((

let uu____8934 = (FStar_TypeChecker_Rel.discharge_guard env g)
in (FStar_All.pipe_left Prims.ignore uu____8934));
(norm env0 t);
))
end))
end)
in (

let env = (

let uu____8936 = ((termination_check_enabled t) && (FStar_TypeChecker_Env.should_verify env))
in (match (uu____8936) with
| true -> begin
(

let uu___120_8937 = env
in {FStar_TypeChecker_Env.solver = uu___120_8937.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___120_8937.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___120_8937.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___120_8937.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___120_8937.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___120_8937.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___120_8937.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___120_8937.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___120_8937.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = uu___120_8937.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___120_8937.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___120_8937.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = (((lb.FStar_Syntax_Syntax.lbname), (t)))::env.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = uu___120_8937.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = uu___120_8937.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = uu___120_8937.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = uu___120_8937.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___120_8937.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = uu___120_8937.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = uu___120_8937.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___120_8937.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___120_8937.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = uu___120_8937.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = uu___120_8937.FStar_TypeChecker_Env.qname_and_index})
end
| uu____8944 -> begin
(FStar_TypeChecker_Env.push_let_binding env lb.FStar_Syntax_Syntax.lbname (([]), (t)))
end))
in (

let lb = (

let uu___121_8947 = lb
in {FStar_Syntax_Syntax.lbname = uu___121_8947.FStar_Syntax_Syntax.lbname; FStar_Syntax_Syntax.lbunivs = univ_vars; FStar_Syntax_Syntax.lbtyp = t; FStar_Syntax_Syntax.lbeff = uu___121_8947.FStar_Syntax_Syntax.lbeff; FStar_Syntax_Syntax.lbdef = e})
in (((lb)::lbs), (env)))))))
end))
end)) (([]), (env)) lbs)
in (match (uu____8885) with
| (lbs, env) -> begin
(((FStar_List.rev lbs)), (env))
end)))))
and check_let_recs : FStar_TypeChecker_Env.env_t  ->  FStar_Syntax_Syntax.letbinding Prims.list  ->  (FStar_Syntax_Syntax.letbinding Prims.list * FStar_TypeChecker_Env.guard_t) = (fun env lbs -> (

let uu____8961 = (

let uu____8966 = (FStar_All.pipe_right lbs (FStar_List.map (fun lb -> (

let uu____8977 = (

let uu____8981 = (FStar_TypeChecker_Env.set_expected_typ env lb.FStar_Syntax_Syntax.lbtyp)
in (tc_tot_or_gtot_term uu____8981 lb.FStar_Syntax_Syntax.lbdef))
in (match (uu____8977) with
| (e, c, g) -> begin
((

let uu____8988 = (

let uu____8989 = (FStar_Syntax_Util.is_total_lcomp c)
in (not (uu____8989)))
in (match (uu____8988) with
| true -> begin
(Prims.raise (FStar_Errors.Error ((("Expected let rec to be a Tot term; got effect GTot"), (e.FStar_Syntax_Syntax.pos)))))
end
| uu____8990 -> begin
()
end));
(

let lb = (FStar_Syntax_Util.mk_letbinding lb.FStar_Syntax_Syntax.lbname lb.FStar_Syntax_Syntax.lbunivs lb.FStar_Syntax_Syntax.lbtyp FStar_Syntax_Const.effect_Tot_lid e)
in ((lb), (g)));
)
end)))))
in (FStar_All.pipe_right uu____8966 FStar_List.unzip))
in (match (uu____8961) with
| (lbs, gs) -> begin
(

let g_lbs = (FStar_List.fold_right FStar_TypeChecker_Rel.conj_guard gs FStar_TypeChecker_Rel.trivial_guard)
in ((lbs), (g_lbs)))
end)))
and check_let_bound_def : Prims.bool  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.letbinding  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.univ_names * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t * Prims.bool) = (fun top_level env lb -> (

let uu____9018 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (uu____9018) with
| (env1, uu____9028) -> begin
(

let e1 = lb.FStar_Syntax_Syntax.lbdef
in (

let uu____9034 = (check_lbtyp top_level env lb)
in (match (uu____9034) with
| (topt, wf_annot, univ_vars, univ_opening, env1) -> begin
((match (((not (top_level)) && (univ_vars <> []))) with
| true -> begin
(Prims.raise (FStar_Errors.Error ((("Inner let-bound definitions cannot be universe polymorphic"), (e1.FStar_Syntax_Syntax.pos)))))
end
| uu____9057 -> begin
()
end);
(

let e1 = (FStar_Syntax_Subst.subst univ_opening e1)
in (

let uu____9060 = (tc_maybe_toplevel_term (

let uu___122_9064 = env1
in {FStar_TypeChecker_Env.solver = uu___122_9064.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___122_9064.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___122_9064.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___122_9064.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___122_9064.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___122_9064.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___122_9064.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___122_9064.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___122_9064.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = uu___122_9064.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___122_9064.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___122_9064.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = uu___122_9064.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = top_level; FStar_TypeChecker_Env.check_uvars = uu___122_9064.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = uu___122_9064.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = uu___122_9064.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___122_9064.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = uu___122_9064.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = uu___122_9064.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___122_9064.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___122_9064.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = uu___122_9064.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = uu___122_9064.FStar_TypeChecker_Env.qname_and_index}) e1)
in (match (uu____9060) with
| (e1, c1, g1) -> begin
(

let uu____9073 = (

let uu____9076 = (FStar_TypeChecker_Env.set_range env1 e1.FStar_Syntax_Syntax.pos)
in (FStar_TypeChecker_Util.strengthen_precondition (Some ((fun uu____9079 -> FStar_TypeChecker_Err.ill_kinded_type))) uu____9076 e1 c1 wf_annot))
in (match (uu____9073) with
| (c1, guard_f) -> begin
(

let g1 = (FStar_TypeChecker_Rel.conj_guard g1 guard_f)
in ((

let uu____9089 = (FStar_TypeChecker_Env.debug env FStar_Options.Extreme)
in (match (uu____9089) with
| true -> begin
(

let uu____9090 = (FStar_Syntax_Print.lbname_to_string lb.FStar_Syntax_Syntax.lbname)
in (

let uu____9091 = (FStar_Syntax_Print.term_to_string c1.FStar_Syntax_Syntax.res_typ)
in (

let uu____9092 = (FStar_TypeChecker_Rel.guard_to_string env g1)
in (FStar_Util.print3 "checked top-level def %s, result type is %s, guard is %s\n" uu____9090 uu____9091 uu____9092))))
end
| uu____9093 -> begin
()
end));
((e1), (univ_vars), (c1), (g1), ((FStar_Option.isSome topt)));
))
end))
end)));
)
end)))
end)))
and check_lbtyp : Prims.bool  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.letbinding  ->  (FStar_Syntax_Syntax.typ Prims.option * FStar_TypeChecker_Env.guard_t * FStar_Syntax_Syntax.univ_names * FStar_Syntax_Syntax.subst_elt Prims.list * FStar_TypeChecker_Env.env) = (fun top_level env lb -> (

let t = (FStar_Syntax_Subst.compress lb.FStar_Syntax_Syntax.lbtyp)
in (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_unknown -> begin
((match ((lb.FStar_Syntax_Syntax.lbunivs <> [])) with
| true -> begin
(failwith "Impossible: non-empty universe variables but the type is unknown")
end
| uu____9114 -> begin
()
end);
((None), (FStar_TypeChecker_Rel.trivial_guard), ([]), ([]), (env));
)
end
| uu____9118 -> begin
(

let uu____9119 = (FStar_Syntax_Subst.univ_var_opening lb.FStar_Syntax_Syntax.lbunivs)
in (match (uu____9119) with
| (univ_opening, univ_vars) -> begin
(

let t = (FStar_Syntax_Subst.subst univ_opening t)
in (

let env1 = (FStar_TypeChecker_Env.push_univ_vars env univ_vars)
in (match ((top_level && (not (env.FStar_TypeChecker_Env.generalize)))) with
| true -> begin
(

let uu____9146 = (FStar_TypeChecker_Env.set_expected_typ env1 t)
in ((Some (t)), (FStar_TypeChecker_Rel.trivial_guard), (univ_vars), (univ_opening), (uu____9146)))
end
| uu____9150 -> begin
(

let uu____9151 = (FStar_Syntax_Util.type_u ())
in (match (uu____9151) with
| (k, uu____9162) -> begin
(

let uu____9163 = (tc_check_tot_or_gtot_term env1 t k)
in (match (uu____9163) with
| (t, uu____9175, g) -> begin
((

let uu____9178 = (FStar_TypeChecker_Env.debug env FStar_Options.Medium)
in (match (uu____9178) with
| true -> begin
(

let uu____9179 = (

let uu____9180 = (FStar_Syntax_Syntax.range_of_lbname lb.FStar_Syntax_Syntax.lbname)
in (FStar_Range.string_of_range uu____9180))
in (

let uu____9181 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print2 "(%s) Checked type annotation %s\n" uu____9179 uu____9181)))
end
| uu____9182 -> begin
()
end));
(

let t = (norm env1 t)
in (

let uu____9184 = (FStar_TypeChecker_Env.set_expected_typ env1 t)
in ((Some (t)), (g), (univ_vars), (univ_opening), (uu____9184))));
)
end))
end))
end)))
end))
end)))
and tc_binder : FStar_TypeChecker_Env.env  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.aqual)  ->  ((FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.aqual) * FStar_TypeChecker_Env.env * FStar_TypeChecker_Env.guard_t * FStar_Syntax_Syntax.universe) = (fun env uu____9189 -> (match (uu____9189) with
| (x, imp) -> begin
(

let uu____9200 = (FStar_Syntax_Util.type_u ())
in (match (uu____9200) with
| (tu, u) -> begin
((

let uu____9212 = (FStar_TypeChecker_Env.debug env FStar_Options.Extreme)
in (match (uu____9212) with
| true -> begin
(

let uu____9213 = (FStar_Syntax_Print.bv_to_string x)
in (

let uu____9214 = (FStar_Syntax_Print.term_to_string x.FStar_Syntax_Syntax.sort)
in (

let uu____9215 = (FStar_Syntax_Print.term_to_string tu)
in (FStar_Util.print3 "Checking binders %s:%s at type %s\n" uu____9213 uu____9214 uu____9215))))
end
| uu____9216 -> begin
()
end));
(

let uu____9217 = (tc_check_tot_or_gtot_term env x.FStar_Syntax_Syntax.sort tu)
in (match (uu____9217) with
| (t, uu____9228, g) -> begin
(

let x = (((

let uu___123_9233 = x
in {FStar_Syntax_Syntax.ppname = uu___123_9233.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = uu___123_9233.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = t})), (imp))
in ((

let uu____9235 = (FStar_TypeChecker_Env.debug env FStar_Options.High)
in (match (uu____9235) with
| true -> begin
(

let uu____9236 = (FStar_Syntax_Print.bv_to_string (Prims.fst x))
in (

let uu____9237 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print2 "Pushing binder %s at type %s\n" uu____9236 uu____9237)))
end
| uu____9238 -> begin
()
end));
(

let uu____9239 = (push_binding env x)
in ((x), (uu____9239), (g), (u)));
))
end));
)
end))
end))
and tc_binders : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.binders  ->  (FStar_Syntax_Syntax.binders * FStar_TypeChecker_Env.env * FStar_TypeChecker_Env.guard_t * FStar_Syntax_Syntax.universes) = (fun env bs -> (

let rec aux = (fun env bs -> (match (bs) with
| [] -> begin
(([]), (env), (FStar_TypeChecker_Rel.trivial_guard), ([]))
end
| (b)::bs -> begin
(

let uu____9290 = (tc_binder env b)
in (match (uu____9290) with
| (b, env', g, u) -> begin
(

let uu____9313 = (aux env' bs)
in (match (uu____9313) with
| (bs, env', g', us) -> begin
(

let uu____9342 = (

let uu____9343 = (FStar_TypeChecker_Rel.close_guard ((b)::[]) g')
in (FStar_TypeChecker_Rel.conj_guard g uu____9343))
in (((b)::bs), (env'), (uu____9342), ((u)::us)))
end))
end))
end))
in (aux env bs)))
and tc_pats : FStar_TypeChecker_Env.env  ->  ((FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.aqual) Prims.list Prims.list  ->  (((FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.aqual) Prims.list Prims.list * FStar_TypeChecker_Env.guard_t) = (fun env pats -> (

let tc_args = (fun env args -> (FStar_List.fold_right (fun uu____9386 uu____9387 -> (match (((uu____9386), (uu____9387))) with
| ((t, imp), (args, g)) -> begin
(

let uu____9424 = (tc_term env t)
in (match (uu____9424) with
| (t, uu____9434, g') -> begin
(

let uu____9436 = (FStar_TypeChecker_Rel.conj_guard g g')
in (((((t), (imp)))::args), (uu____9436)))
end))
end)) args (([]), (FStar_TypeChecker_Rel.trivial_guard))))
in (FStar_List.fold_right (fun p uu____9454 -> (match (uu____9454) with
| (pats, g) -> begin
(

let uu____9468 = (tc_args env p)
in (match (uu____9468) with
| (args, g') -> begin
(

let uu____9476 = (FStar_TypeChecker_Rel.conj_guard g g')
in (((args)::pats), (uu____9476)))
end))
end)) pats (([]), (FStar_TypeChecker_Rel.trivial_guard)))))
and tc_tot_or_gtot_term : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env e -> (

let uu____9484 = (tc_maybe_toplevel_term env e)
in (match (uu____9484) with
| (e, c, g) -> begin
(

let uu____9494 = (FStar_Syntax_Util.is_tot_or_gtot_lcomp c)
in (match (uu____9494) with
| true -> begin
((e), (c), (g))
end
| uu____9498 -> begin
(

let g = (FStar_TypeChecker_Rel.solve_deferred_constraints env g)
in (

let c = (c.FStar_Syntax_Syntax.comp ())
in (

let c = (norm_c env c)
in (

let uu____9504 = (

let uu____9507 = (FStar_TypeChecker_Util.is_pure_effect env (FStar_Syntax_Util.comp_effect_name c))
in (match (uu____9507) with
| true -> begin
(

let uu____9510 = (FStar_Syntax_Syntax.mk_Total (FStar_Syntax_Util.comp_result c))
in ((uu____9510), (false)))
end
| uu____9511 -> begin
(

let uu____9512 = (FStar_Syntax_Syntax.mk_GTotal (FStar_Syntax_Util.comp_result c))
in ((uu____9512), (true)))
end))
in (match (uu____9504) with
| (target_comp, allow_ghost) -> begin
(

let uu____9518 = (FStar_TypeChecker_Rel.sub_comp env c target_comp)
in (match (uu____9518) with
| Some (g') -> begin
(

let uu____9524 = (FStar_TypeChecker_Rel.conj_guard g g')
in ((e), ((FStar_Syntax_Util.lcomp_of_comp target_comp)), (uu____9524)))
end
| uu____9525 -> begin
(match (allow_ghost) with
| true -> begin
(

let uu____9530 = (

let uu____9531 = (

let uu____9534 = (FStar_TypeChecker_Err.expected_ghost_expression e c)
in ((uu____9534), (e.FStar_Syntax_Syntax.pos)))
in FStar_Errors.Error (uu____9531))
in (Prims.raise uu____9530))
end
| uu____9538 -> begin
(

let uu____9539 = (

let uu____9540 = (

let uu____9543 = (FStar_TypeChecker_Err.expected_pure_expression e c)
in ((uu____9543), (e.FStar_Syntax_Syntax.pos)))
in FStar_Errors.Error (uu____9540))
in (Prims.raise uu____9539))
end)
end))
end)))))
end))
end)))
and tc_check_tot_or_gtot_term : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.typ  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp * FStar_TypeChecker_Env.guard_t) = (fun env e t -> (

let env = (FStar_TypeChecker_Env.set_expected_typ env t)
in (tc_tot_or_gtot_term env e)))
and tc_trivial_guard : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.lcomp) = (fun env t -> (

let uu____9556 = (tc_tot_or_gtot_term env t)
in (match (uu____9556) with
| (t, c, g) -> begin
((FStar_TypeChecker_Rel.force_trivial_guard env g);
((t), (c));
)
end)))


let type_of_tot_term : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.typ * FStar_TypeChecker_Env.guard_t) = (fun env e -> ((

let uu____9576 = (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env) (FStar_Options.Other ("RelCheck")))
in (match (uu____9576) with
| true -> begin
(

let uu____9577 = (FStar_Syntax_Print.term_to_string e)
in (FStar_Util.print1 "Checking term %s\n" uu____9577))
end
| uu____9578 -> begin
()
end));
(

let env = (

let uu___124_9580 = env
in {FStar_TypeChecker_Env.solver = uu___124_9580.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___124_9580.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___124_9580.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___124_9580.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___124_9580.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___124_9580.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___124_9580.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___124_9580.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___124_9580.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = uu___124_9580.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___124_9580.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___124_9580.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = []; FStar_TypeChecker_Env.top_level = false; FStar_TypeChecker_Env.check_uvars = uu___124_9580.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = uu___124_9580.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = uu___124_9580.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___124_9580.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = uu___124_9580.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = uu___124_9580.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___124_9580.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___124_9580.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = true; FStar_TypeChecker_Env.qname_and_index = uu___124_9580.FStar_TypeChecker_Env.qname_and_index})
in (

let uu____9583 = try
(match (()) with
| () -> begin
(tc_tot_or_gtot_term env e)
end)
with
| FStar_Errors.Error (msg, uu____9599) -> begin
(

let uu____9600 = (

let uu____9601 = (

let uu____9604 = (FStar_TypeChecker_Env.get_range env)
in (((Prims.strcat "Implicit argument: " msg)), (uu____9604)))
in FStar_Errors.Error (uu____9601))
in (Prims.raise uu____9600))
end
in (match (uu____9583) with
| (t, c, g) -> begin
(

let uu____9614 = (FStar_Syntax_Util.is_total_lcomp c)
in (match (uu____9614) with
| true -> begin
((t), (c.FStar_Syntax_Syntax.res_typ), (g))
end
| uu____9620 -> begin
(

let uu____9621 = (

let uu____9622 = (

let uu____9625 = (

let uu____9626 = (FStar_Syntax_Print.term_to_string e)
in (FStar_Util.format1 "Implicit argument: Expected a total term; got a ghost term: %s" uu____9626))
in (

let uu____9627 = (FStar_TypeChecker_Env.get_range env)
in ((uu____9625), (uu____9627))))
in FStar_Errors.Error (uu____9622))
in (Prims.raise uu____9621))
end))
end)));
))


let level_of_type_fail = (fun env e t -> (

let uu____9648 = (

let uu____9649 = (

let uu____9652 = (

let uu____9653 = (FStar_Syntax_Print.term_to_string e)
in (FStar_Util.format2 "Expected a term of type \'Type\'; got %s : %s" uu____9653 t))
in (

let uu____9654 = (FStar_TypeChecker_Env.get_range env)
in ((uu____9652), (uu____9654))))
in FStar_Errors.Error (uu____9649))
in (Prims.raise uu____9648)))


let level_of_type : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.universe = (fun env e t -> (

let rec aux = (fun retry t -> (

let uu____9671 = (

let uu____9672 = (FStar_Syntax_Util.unrefine t)
in uu____9672.FStar_Syntax_Syntax.n)
in (match (uu____9671) with
| FStar_Syntax_Syntax.Tm_type (u) -> begin
u
end
| uu____9676 -> begin
(match (retry) with
| true -> begin
(

let t = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.UnfoldUntil (FStar_Syntax_Syntax.Delta_constant))::[]) env t)
in (aux false t))
end
| uu____9678 -> begin
(

let uu____9679 = (FStar_Syntax_Util.type_u ())
in (match (uu____9679) with
| (t_u, u) -> begin
(

let env = (

let uu___127_9685 = env
in {FStar_TypeChecker_Env.solver = uu___127_9685.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___127_9685.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___127_9685.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___127_9685.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___127_9685.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___127_9685.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___127_9685.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___127_9685.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___127_9685.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = uu___127_9685.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___127_9685.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___127_9685.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = uu___127_9685.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = uu___127_9685.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = uu___127_9685.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = uu___127_9685.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = uu___127_9685.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___127_9685.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = true; FStar_TypeChecker_Env.lax_universes = uu___127_9685.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___127_9685.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___127_9685.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = uu___127_9685.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = uu___127_9685.FStar_TypeChecker_Env.qname_and_index})
in (

let g = (FStar_TypeChecker_Rel.teq env t t_u)
in ((match (g.FStar_TypeChecker_Env.guard_f) with
| FStar_TypeChecker_Common.NonTrivial (f) -> begin
(

let uu____9689 = (FStar_Syntax_Print.term_to_string t)
in (level_of_type_fail env e uu____9689))
end
| uu____9690 -> begin
(FStar_TypeChecker_Rel.force_trivial_guard env g)
end);
u;
)))
end))
end)
end)))
in (aux true t)))


let rec universe_of_aux : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term', FStar_Syntax_Syntax.term') FStar_Syntax_Syntax.syntax = (fun env e -> (

let uu____9699 = (

let uu____9700 = (FStar_Syntax_Subst.compress e)
in uu____9700.FStar_Syntax_Syntax.n)
in (match (uu____9699) with
| (FStar_Syntax_Syntax.Tm_bvar (_)) | (FStar_Syntax_Syntax.Tm_unknown) | (FStar_Syntax_Syntax.Tm_delayed (_)) -> begin
(failwith "Impossible")
end
| FStar_Syntax_Syntax.Tm_let (uu____9709) -> begin
(

let e = (FStar_TypeChecker_Normalize.normalize [] env e)
in (universe_of_aux env e))
end
| FStar_Syntax_Syntax.Tm_abs (bs, t, uu____9720) -> begin
(level_of_type_fail env e "arrow type")
end
| FStar_Syntax_Syntax.Tm_uvar (uu____9745, t) -> begin
t
end
| FStar_Syntax_Syntax.Tm_meta (t, uu____9760) -> begin
(universe_of_aux env t)
end
| FStar_Syntax_Syntax.Tm_name (n) -> begin
n.FStar_Syntax_Syntax.sort
end
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(

let uu____9767 = (FStar_TypeChecker_Env.lookup_lid env fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
in (match (uu____9767) with
| (uu____9776, t) -> begin
t
end))
end
| FStar_Syntax_Syntax.Tm_ascribed (uu____9778, FStar_Util.Inl (t), uu____9780) -> begin
t
end
| FStar_Syntax_Syntax.Tm_ascribed (uu____9799, FStar_Util.Inr (c), uu____9801) -> begin
(FStar_Syntax_Util.comp_result c)
end
| FStar_Syntax_Syntax.Tm_type (u) -> begin
((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (FStar_Syntax_Syntax.U_succ (u)))) None e.FStar_Syntax_Syntax.pos)
end
| FStar_Syntax_Syntax.Tm_constant (sc) -> begin
(tc_constant e.FStar_Syntax_Syntax.pos sc)
end
| FStar_Syntax_Syntax.Tm_uinst ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (fv); FStar_Syntax_Syntax.tk = uu____9831; FStar_Syntax_Syntax.pos = uu____9832; FStar_Syntax_Syntax.vars = uu____9833}, us) -> begin
(

let uu____9839 = (FStar_TypeChecker_Env.lookup_lid env fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
in (match (uu____9839) with
| (us', t) -> begin
((match (((FStar_List.length us) <> (FStar_List.length us'))) with
| true -> begin
(

let uu____9855 = (

let uu____9856 = (

let uu____9859 = (FStar_TypeChecker_Env.get_range env)
in (("Unexpected number of universe instantiations"), (uu____9859)))
in FStar_Errors.Error (uu____9856))
in (Prims.raise uu____9855))
end
| uu____9860 -> begin
(FStar_List.iter2 (fun u' u -> (match (u') with
| FStar_Syntax_Syntax.U_unif (u'') -> begin
(FStar_Unionfind.change u'' (Some (u)))
end
| uu____9867 -> begin
(failwith "Impossible")
end)) us' us)
end);
t;
)
end))
end
| FStar_Syntax_Syntax.Tm_uinst (uu____9868) -> begin
(failwith "Impossible: Tm_uinst\'s head must be an fvar")
end
| FStar_Syntax_Syntax.Tm_refine (x, uu____9876) -> begin
(universe_of_aux env x.FStar_Syntax_Syntax.sort)
end
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(

let uu____9893 = (FStar_Syntax_Subst.open_comp bs c)
in (match (uu____9893) with
| (bs, c) -> begin
(

let us = (FStar_List.map (fun uu____9904 -> (match (uu____9904) with
| (b, uu____9908) -> begin
(

let uu____9909 = (universe_of_aux env b.FStar_Syntax_Syntax.sort)
in (level_of_type env b.FStar_Syntax_Syntax.sort uu____9909))
end)) bs)
in (

let u_res = (

let res = (FStar_Syntax_Util.comp_result c)
in (

let uu____9914 = (universe_of_aux env res)
in (level_of_type env res uu____9914)))
in (

let u_c = (

let uu____9916 = (FStar_TypeChecker_Env.effect_repr env c u_res)
in (match (uu____9916) with
| None -> begin
u_res
end
| Some (trepr) -> begin
(

let uu____9919 = (universe_of_aux env trepr)
in (level_of_type env trepr uu____9919))
end))
in (

let u = (FStar_TypeChecker_Normalize.normalize_universe env (FStar_Syntax_Syntax.U_max ((u_c)::us)))
in ((FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (u))) None e.FStar_Syntax_Syntax.pos)))))
end))
end
| FStar_Syntax_Syntax.Tm_app (hd, args) -> begin
(

let rec type_of_head = (fun retry hd args -> (

let hd = (FStar_Syntax_Subst.compress hd)
in (match (hd.FStar_Syntax_Syntax.n) with
| (FStar_Syntax_Syntax.Tm_unknown) | (FStar_Syntax_Syntax.Tm_bvar (_)) | (FStar_Syntax_Syntax.Tm_delayed (_)) -> begin
(failwith "Impossible")
end
| (FStar_Syntax_Syntax.Tm_fvar (_)) | (FStar_Syntax_Syntax.Tm_name (_)) | (FStar_Syntax_Syntax.Tm_uvar (_)) | (FStar_Syntax_Syntax.Tm_uinst (_)) | (FStar_Syntax_Syntax.Tm_ascribed (_)) | (FStar_Syntax_Syntax.Tm_refine (_)) | (FStar_Syntax_Syntax.Tm_constant (_)) | (FStar_Syntax_Syntax.Tm_arrow (_)) | (FStar_Syntax_Syntax.Tm_meta (_)) | (FStar_Syntax_Syntax.Tm_type (_)) -> begin
(

let uu____10005 = (universe_of_aux env hd)
in ((uu____10005), (args)))
end
| FStar_Syntax_Syntax.Tm_match (uu____10015, (hd)::uu____10017) -> begin
(

let uu____10064 = (FStar_Syntax_Subst.open_branch hd)
in (match (uu____10064) with
| (uu____10074, uu____10075, hd) -> begin
(

let uu____10091 = (FStar_Syntax_Util.head_and_args hd)
in (match (uu____10091) with
| (hd, args) -> begin
(type_of_head retry hd args)
end))
end))
end
| uu____10126 when retry -> begin
(

let e = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.Beta)::(FStar_TypeChecker_Normalize.NoDeltaSteps)::[]) env e)
in (

let uu____10128 = (FStar_Syntax_Util.head_and_args e)
in (match (uu____10128) with
| (hd, args) -> begin
(type_of_head false hd args)
end)))
end
| uu____10163 -> begin
(

let uu____10164 = (FStar_TypeChecker_Env.clear_expected_typ env)
in (match (uu____10164) with
| (env, uu____10178) -> begin
(

let env = (

let uu___128_10182 = env
in {FStar_TypeChecker_Env.solver = uu___128_10182.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = uu___128_10182.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = uu___128_10182.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = uu___128_10182.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = uu___128_10182.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = uu___128_10182.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = uu___128_10182.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = uu___128_10182.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = uu___128_10182.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = uu___128_10182.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = uu___128_10182.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = uu___128_10182.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = uu___128_10182.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = false; FStar_TypeChecker_Env.check_uvars = uu___128_10182.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = uu___128_10182.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = uu___128_10182.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = uu___128_10182.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = true; FStar_TypeChecker_Env.lax_universes = uu___128_10182.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = uu___128_10182.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = uu___128_10182.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = true; FStar_TypeChecker_Env.qname_and_index = uu___128_10182.FStar_TypeChecker_Env.qname_and_index})
in ((

let uu____10184 = (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env) (FStar_Options.Other ("UniverseOf")))
in (match (uu____10184) with
| true -> begin
(

let uu____10185 = (

let uu____10186 = (FStar_TypeChecker_Env.get_range env)
in (FStar_Range.string_of_range uu____10186))
in (

let uu____10187 = (FStar_Syntax_Print.term_to_string hd)
in (FStar_Util.print2 "%s: About to type-check %s\n" uu____10185 uu____10187)))
end
| uu____10188 -> begin
()
end));
(

let uu____10189 = (tc_term env hd)
in (match (uu____10189) with
| (uu____10202, {FStar_Syntax_Syntax.eff_name = uu____10203; FStar_Syntax_Syntax.res_typ = t; FStar_Syntax_Syntax.cflags = uu____10205; FStar_Syntax_Syntax.comp = uu____10206}, g) -> begin
((

let uu____10216 = (FStar_TypeChecker_Rel.solve_deferred_constraints env g)
in (FStar_All.pipe_right uu____10216 Prims.ignore));
((t), (args));
)
end));
))
end))
end)))
in (

let uu____10224 = (type_of_head true hd args)
in (match (uu____10224) with
| (t, args) -> begin
(

let t = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.UnfoldUntil (FStar_Syntax_Syntax.Delta_constant))::[]) env t)
in (

let uu____10253 = (FStar_Syntax_Util.arrow_formals_comp t)
in (match (uu____10253) with
| (bs, res) -> begin
(

let res = (FStar_Syntax_Util.comp_result res)
in (match (((FStar_List.length bs) = (FStar_List.length args))) with
| true -> begin
(

let subst = (FStar_Syntax_Util.subst_of_list bs args)
in (FStar_Syntax_Subst.subst subst res))
end
| uu____10285 -> begin
(

let uu____10286 = (FStar_Syntax_Print.term_to_string res)
in (level_of_type_fail env e uu____10286))
end))
end)))
end)))
end
| FStar_Syntax_Syntax.Tm_match (uu____10289, (hd)::uu____10291) -> begin
(

let uu____10338 = (FStar_Syntax_Subst.open_branch hd)
in (match (uu____10338) with
| (uu____10341, uu____10342, hd) -> begin
(universe_of_aux env hd)
end))
end
| FStar_Syntax_Syntax.Tm_match (uu____10358, []) -> begin
(level_of_type_fail env e "empty match cases")
end)))


let universe_of : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.universe = (fun env e -> (

let uu____10392 = (universe_of_aux env e)
in (level_of_type env e uu____10392)))


let tc_tparams : FStar_TypeChecker_Env.env_t  ->  FStar_Syntax_Syntax.binders  ->  (FStar_Syntax_Syntax.binders * FStar_TypeChecker_Env.env * FStar_Syntax_Syntax.universes) = (fun env tps -> (

let uu____10405 = (tc_binders env tps)
in (match (uu____10405) with
| (tps, env, g, us) -> begin
((FStar_TypeChecker_Rel.force_trivial_guard env g);
((tps), (env), (us));
)
end)))




