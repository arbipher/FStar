open Prims
type lcomp_with_binder =
  (FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option,FStar_Syntax_Syntax.lcomp)
    FStar_Pervasives_Native.tuple2
let (report : FStar_TypeChecker_Env.env -> Prims.string Prims.list -> unit) =
  fun env  ->
    fun errs  ->
      let uu____21 = FStar_TypeChecker_Env.get_range env  in
      let uu____22 = FStar_TypeChecker_Err.failed_to_prove_specification errs
         in
      FStar_Errors.log_issue uu____21 uu____22
  
let (new_implicit_var :
  Prims.string ->
    FStar_Range.range ->
      FStar_TypeChecker_Env.env ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term,(FStar_Syntax_Syntax.ctx_uvar,FStar_Range.range)
                                      FStar_Pervasives_Native.tuple2
                                      Prims.list,FStar_TypeChecker_Env.guard_t)
            FStar_Pervasives_Native.tuple3)
  =
  fun reason  ->
    fun r  ->
      fun env  ->
        fun k  ->
          FStar_TypeChecker_Env.new_implicit_var_aux reason r env k
            FStar_Syntax_Syntax.Strict
  
let (close_guard_implicits :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binders ->
      FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t)
  =
  fun env  ->
    fun xs  ->
      fun g  ->
        let uu____74 =
          let uu____75 = FStar_Options.eager_subtyping ()  in
          FStar_All.pipe_left Prims.op_Negation uu____75  in
        if uu____74
        then g
        else
          (let uu____77 =
             FStar_All.pipe_right g.FStar_TypeChecker_Env.deferred
               (FStar_List.partition
                  (fun uu____123  ->
                     match uu____123 with
                     | (uu____128,p) ->
                         FStar_TypeChecker_Rel.flex_prob_closing env xs p))
              in
           match uu____77 with
           | (solve_now,defer) ->
               ((let uu____157 =
                   FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                     (FStar_Options.Other "Rel")
                    in
                 if uu____157
                 then
                   (FStar_Util.print_string "SOLVE BEFORE CLOSING:\n";
                    FStar_List.iter
                      (fun uu____168  ->
                         match uu____168 with
                         | (s,p) ->
                             let uu____175 =
                               FStar_TypeChecker_Rel.prob_to_string env p  in
                             FStar_Util.print2 "%s: %s\n" s uu____175)
                      solve_now;
                    FStar_Util.print_string " ...DEFERRED THE REST:\n";
                    FStar_List.iter
                      (fun uu____186  ->
                         match uu____186 with
                         | (s,p) ->
                             let uu____193 =
                               FStar_TypeChecker_Rel.prob_to_string env p  in
                             FStar_Util.print2 "%s: %s\n" s uu____193) defer;
                    FStar_Util.print_string "END\n")
                 else ());
                (let g1 =
                   FStar_TypeChecker_Rel.solve_deferred_constraints env
                     (let uu___349_197 = g  in
                      {
                        FStar_TypeChecker_Env.guard_f =
                          (uu___349_197.FStar_TypeChecker_Env.guard_f);
                        FStar_TypeChecker_Env.deferred = solve_now;
                        FStar_TypeChecker_Env.univ_ineqs =
                          (uu___349_197.FStar_TypeChecker_Env.univ_ineqs);
                        FStar_TypeChecker_Env.implicits =
                          (uu___349_197.FStar_TypeChecker_Env.implicits)
                      })
                    in
                 let g2 =
                   let uu___350_199 = g1  in
                   {
                     FStar_TypeChecker_Env.guard_f =
                       (uu___350_199.FStar_TypeChecker_Env.guard_f);
                     FStar_TypeChecker_Env.deferred = defer;
                     FStar_TypeChecker_Env.univ_ineqs =
                       (uu___350_199.FStar_TypeChecker_Env.univ_ineqs);
                     FStar_TypeChecker_Env.implicits =
                       (uu___350_199.FStar_TypeChecker_Env.implicits)
                   }  in
                 g2)))
  
let (check_uvars : FStar_Range.range -> FStar_Syntax_Syntax.typ -> unit) =
  fun r  ->
    fun t  ->
      let uvs = FStar_Syntax_Free.uvars t  in
      let uu____213 =
        let uu____214 = FStar_Util.set_is_empty uvs  in
        Prims.op_Negation uu____214  in
      if uu____213
      then
        let us =
          let uu____216 =
            let uu____219 = FStar_Util.set_elements uvs  in
            FStar_List.map
              (fun u  ->
                 FStar_Syntax_Print.uvar_to_string
                   u.FStar_Syntax_Syntax.ctx_uvar_head) uu____219
             in
          FStar_All.pipe_right uu____216 (FStar_String.concat ", ")  in
        (FStar_Options.push ();
         FStar_Options.set_option "hide_uvar_nums" (FStar_Options.Bool false);
         FStar_Options.set_option "print_implicits" (FStar_Options.Bool true);
         (let uu____230 =
            let uu____235 =
              let uu____236 = FStar_Syntax_Print.term_to_string t  in
              FStar_Util.format2
                "Unconstrained unification variables %s in type signature %s; please add an annotation"
                us uu____236
               in
            (FStar_Errors.Error_UncontrainedUnificationVar, uu____235)  in
          FStar_Errors.log_issue r uu____230);
         FStar_Options.pop ())
      else ()
  
let (extract_let_rec_annotation :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.letbinding ->
      (FStar_Syntax_Syntax.univ_names,FStar_Syntax_Syntax.typ,Prims.bool)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun uu____253  ->
      match uu____253 with
      | { FStar_Syntax_Syntax.lbname = lbname;
          FStar_Syntax_Syntax.lbunivs = univ_vars1;
          FStar_Syntax_Syntax.lbtyp = t;
          FStar_Syntax_Syntax.lbeff = uu____263;
          FStar_Syntax_Syntax.lbdef = e;
          FStar_Syntax_Syntax.lbattrs = uu____265;
          FStar_Syntax_Syntax.lbpos = uu____266;_} ->
          let rng = FStar_Syntax_Syntax.range_of_lbname lbname  in
          let t1 = FStar_Syntax_Subst.compress t  in
          (match t1.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Tm_unknown  ->
               let uu____299 = FStar_Syntax_Subst.open_univ_vars univ_vars1 e
                  in
               (match uu____299 with
                | (univ_vars2,e1) ->
                    let env1 =
                      FStar_TypeChecker_Env.push_univ_vars env univ_vars2  in
                    let r = FStar_TypeChecker_Env.get_range env1  in
                    let rec aux e2 =
                      let e3 = FStar_Syntax_Subst.compress e2  in
                      match e3.FStar_Syntax_Syntax.n with
                      | FStar_Syntax_Syntax.Tm_meta (e4,uu____336) -> aux e4
                      | FStar_Syntax_Syntax.Tm_ascribed (e4,t2,uu____343) ->
                          FStar_Pervasives_Native.fst t2
                      | FStar_Syntax_Syntax.Tm_abs (bs,body,uu____398) ->
                          let res = aux body  in
                          let c =
                            match res with
                            | FStar_Util.Inl t2 ->
                                let uu____434 = FStar_Options.ml_ish ()  in
                                if uu____434
                                then FStar_Syntax_Util.ml_comp t2 r
                                else FStar_Syntax_Syntax.mk_Total t2
                            | FStar_Util.Inr c -> c  in
                          let t2 =
                            FStar_Syntax_Syntax.mk
                              (FStar_Syntax_Syntax.Tm_arrow (bs, c))
                              FStar_Pervasives_Native.None
                              c.FStar_Syntax_Syntax.pos
                             in
                          ((let uu____453 =
                              FStar_TypeChecker_Env.debug env1
                                FStar_Options.High
                               in
                            if uu____453
                            then
                              let uu____454 = FStar_Range.string_of_range r
                                 in
                              let uu____455 =
                                FStar_Syntax_Print.term_to_string t2  in
                              FStar_Util.print2 "(%s) Using type %s\n"
                                uu____454 uu____455
                            else ());
                           FStar_Util.Inl t2)
                      | uu____457 -> FStar_Util.Inl FStar_Syntax_Syntax.tun
                       in
                    let t2 =
                      let uu____459 = aux e1  in
                      match uu____459 with
                      | FStar_Util.Inr c ->
                          let uu____465 =
                            FStar_Syntax_Util.is_tot_or_gtot_comp c  in
                          if uu____465
                          then FStar_Syntax_Util.comp_result c
                          else
                            (let uu____467 =
                               let uu____472 =
                                 let uu____473 =
                                   FStar_Syntax_Print.comp_to_string c  in
                                 FStar_Util.format1
                                   "Expected a 'let rec' to be annotated with a value type; got a computation type %s"
                                   uu____473
                                  in
                               (FStar_Errors.Fatal_UnexpectedComputationTypeForLetRec,
                                 uu____472)
                                in
                             FStar_Errors.raise_error uu____467 rng)
                      | FStar_Util.Inl t2 -> t2  in
                    (univ_vars2, t2, true))
           | uu____477 ->
               let uu____478 =
                 FStar_Syntax_Subst.open_univ_vars univ_vars1 t1  in
               (match uu____478 with
                | (univ_vars2,t2) -> (univ_vars2, t2, false)))
  
let rec (decorated_pattern_as_term :
  FStar_Syntax_Syntax.pat ->
    (FStar_Syntax_Syntax.bv Prims.list,FStar_Syntax_Syntax.term)
      FStar_Pervasives_Native.tuple2)
  =
  fun pat  ->
    let mk1 f =
      FStar_Syntax_Syntax.mk f FStar_Pervasives_Native.None
        pat.FStar_Syntax_Syntax.p
       in
    let pat_as_arg uu____537 =
      match uu____537 with
      | (p,i) ->
          let uu____554 = decorated_pattern_as_term p  in
          (match uu____554 with
           | (vars,te) ->
               let uu____577 =
                 let uu____582 = FStar_Syntax_Syntax.as_implicit i  in
                 (te, uu____582)  in
               (vars, uu____577))
       in
    match pat.FStar_Syntax_Syntax.v with
    | FStar_Syntax_Syntax.Pat_constant c ->
        let uu____596 = mk1 (FStar_Syntax_Syntax.Tm_constant c)  in
        ([], uu____596)
    | FStar_Syntax_Syntax.Pat_wild x ->
        let uu____600 = mk1 (FStar_Syntax_Syntax.Tm_name x)  in
        ([x], uu____600)
    | FStar_Syntax_Syntax.Pat_var x ->
        let uu____604 = mk1 (FStar_Syntax_Syntax.Tm_name x)  in
        ([x], uu____604)
    | FStar_Syntax_Syntax.Pat_cons (fv,pats) ->
        let uu____625 =
          let uu____644 =
            FStar_All.pipe_right pats (FStar_List.map pat_as_arg)  in
          FStar_All.pipe_right uu____644 FStar_List.unzip  in
        (match uu____625 with
         | (vars,args) ->
             let vars1 = FStar_List.flatten vars  in
             let uu____780 =
               let uu____781 =
                 let uu____782 =
                   let uu____799 = FStar_Syntax_Syntax.fv_to_tm fv  in
                   (uu____799, args)  in
                 FStar_Syntax_Syntax.Tm_app uu____782  in
               mk1 uu____781  in
             (vars1, uu____780))
    | FStar_Syntax_Syntax.Pat_dot_term (x,e) -> ([], e)
  
let (comp_univ_opt :
  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax ->
    FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option)
  =
  fun c  ->
    match c.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Total (uu____837,uopt) -> uopt
    | FStar_Syntax_Syntax.GTotal (uu____847,uopt) -> uopt
    | FStar_Syntax_Syntax.Comp c1 ->
        (match c1.FStar_Syntax_Syntax.comp_univs with
         | [] -> FStar_Pervasives_Native.None
         | hd1::uu____861 -> FStar_Pervasives_Native.Some hd1)
  
let (destruct_comp :
  FStar_Syntax_Syntax.comp_typ ->
    (FStar_Syntax_Syntax.universe,FStar_Syntax_Syntax.typ,FStar_Syntax_Syntax.typ)
      FStar_Pervasives_Native.tuple3)
  =
  fun c  ->
    let wp =
      match c.FStar_Syntax_Syntax.effect_args with
      | (wp,uu____883)::[] -> wp
      | uu____908 ->
          let uu____919 =
            let uu____920 =
              let uu____921 =
                FStar_List.map
                  (fun uu____933  ->
                     match uu____933 with
                     | (x,uu____941) -> FStar_Syntax_Print.term_to_string x)
                  c.FStar_Syntax_Syntax.effect_args
                 in
              FStar_All.pipe_right uu____921 (FStar_String.concat ", ")  in
            FStar_Util.format2
              "Impossible: Got a computation %s with effect args [%s]"
              (c.FStar_Syntax_Syntax.effect_name).FStar_Ident.str uu____920
             in
          failwith uu____919
       in
    let uu____948 = FStar_List.hd c.FStar_Syntax_Syntax.comp_univs  in
    (uu____948, (c.FStar_Syntax_Syntax.result_typ), wp)
  
let (lift_comp :
  FStar_Syntax_Syntax.comp_typ ->
    FStar_Ident.lident ->
      FStar_TypeChecker_Env.mlift -> FStar_Syntax_Syntax.comp_typ)
  =
  fun c  ->
    fun m  ->
      fun lift  ->
        let uu____964 = destruct_comp c  in
        match uu____964 with
        | (u,uu____972,wp) ->
            let uu____974 =
              let uu____985 =
                let uu____994 =
                  lift.FStar_TypeChecker_Env.mlift_wp u
                    c.FStar_Syntax_Syntax.result_typ wp
                   in
                FStar_Syntax_Syntax.as_arg uu____994  in
              [uu____985]  in
            {
              FStar_Syntax_Syntax.comp_univs = [u];
              FStar_Syntax_Syntax.effect_name = m;
              FStar_Syntax_Syntax.result_typ =
                (c.FStar_Syntax_Syntax.result_typ);
              FStar_Syntax_Syntax.effect_args = uu____974;
              FStar_Syntax_Syntax.flags = []
            }
  
let (join_effects :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident -> FStar_Ident.lident -> FStar_Ident.lident)
  =
  fun env  ->
    fun l1  ->
      fun l2  ->
        let uu____1026 =
          let uu____1033 = FStar_TypeChecker_Env.norm_eff_name env l1  in
          let uu____1034 = FStar_TypeChecker_Env.norm_eff_name env l2  in
          FStar_TypeChecker_Env.join env uu____1033 uu____1034  in
        match uu____1026 with | (m,uu____1036,uu____1037) -> m
  
let (join_lcomp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.lcomp ->
      FStar_Syntax_Syntax.lcomp -> FStar_Ident.lident)
  =
  fun env  ->
    fun c1  ->
      fun c2  ->
        let uu____1053 =
          (FStar_Syntax_Util.is_total_lcomp c1) &&
            (FStar_Syntax_Util.is_total_lcomp c2)
           in
        if uu____1053
        then FStar_Parser_Const.effect_Tot_lid
        else
          join_effects env c1.FStar_Syntax_Syntax.eff_name
            c2.FStar_Syntax_Syntax.eff_name
  
let (lift_and_destruct :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      FStar_Syntax_Syntax.comp ->
        ((FStar_Syntax_Syntax.eff_decl,FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.term)
           FStar_Pervasives_Native.tuple3,(FStar_Syntax_Syntax.universe,
                                            FStar_Syntax_Syntax.typ,FStar_Syntax_Syntax.typ)
                                            FStar_Pervasives_Native.tuple3,
          (FStar_Syntax_Syntax.universe,FStar_Syntax_Syntax.typ,FStar_Syntax_Syntax.typ)
            FStar_Pervasives_Native.tuple3)
          FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun c1  ->
      fun c2  ->
        let c11 = FStar_TypeChecker_Env.unfold_effect_abbrev env c1  in
        let c21 = FStar_TypeChecker_Env.unfold_effect_abbrev env c2  in
        let uu____1096 =
          FStar_TypeChecker_Env.join env c11.FStar_Syntax_Syntax.effect_name
            c21.FStar_Syntax_Syntax.effect_name
           in
        match uu____1096 with
        | (m,lift1,lift2) ->
            let m1 = lift_comp c11 m lift1  in
            let m2 = lift_comp c21 m lift2  in
            let md = FStar_TypeChecker_Env.get_effect_decl env m  in
            let uu____1133 =
              FStar_TypeChecker_Env.wp_signature env
                md.FStar_Syntax_Syntax.mname
               in
            (match uu____1133 with
             | (a,kwp) ->
                 let uu____1164 = destruct_comp m1  in
                 let uu____1171 = destruct_comp m2  in
                 ((md, a, kwp), uu____1164, uu____1171))
  
let (is_pure_effect :
  FStar_TypeChecker_Env.env -> FStar_Ident.lident -> Prims.bool) =
  fun env  ->
    fun l  ->
      let l1 = FStar_TypeChecker_Env.norm_eff_name env l  in
      FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_PURE_lid
  
let (is_pure_or_ghost_effect :
  FStar_TypeChecker_Env.env -> FStar_Ident.lident -> Prims.bool) =
  fun env  ->
    fun l  ->
      let l1 = FStar_TypeChecker_Env.norm_eff_name env l  in
      (FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_PURE_lid) ||
        (FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_GHOST_lid)
  
let (mk_comp_l :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.cflags Prims.list -> FStar_Syntax_Syntax.comp)
  =
  fun mname  ->
    fun u_result  ->
      fun result  ->
        fun wp  ->
          fun flags1  ->
            let uu____1251 =
              let uu____1252 =
                let uu____1263 = FStar_Syntax_Syntax.as_arg wp  in
                [uu____1263]  in
              {
                FStar_Syntax_Syntax.comp_univs = [u_result];
                FStar_Syntax_Syntax.effect_name = mname;
                FStar_Syntax_Syntax.result_typ = result;
                FStar_Syntax_Syntax.effect_args = uu____1252;
                FStar_Syntax_Syntax.flags = flags1
              }  in
            FStar_Syntax_Syntax.mk_Comp uu____1251
  
let (mk_comp :
  FStar_Syntax_Syntax.eff_decl ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.cflags Prims.list -> FStar_Syntax_Syntax.comp)
  = fun md  -> mk_comp_l md.FStar_Syntax_Syntax.mname 
let (lax_mk_tot_or_comp_l :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.cflags Prims.list -> FStar_Syntax_Syntax.comp)
  =
  fun mname  ->
    fun u_result  ->
      fun result  ->
        fun flags1  ->
          let uu____1345 =
            FStar_Ident.lid_equals mname FStar_Parser_Const.effect_Tot_lid
             in
          if uu____1345
          then
            FStar_Syntax_Syntax.mk_Total' result
              (FStar_Pervasives_Native.Some u_result)
          else mk_comp_l mname u_result result FStar_Syntax_Syntax.tun flags1
  
let (subst_lcomp :
  FStar_Syntax_Syntax.subst_t ->
    FStar_Syntax_Syntax.lcomp -> FStar_Syntax_Syntax.lcomp)
  =
  fun subst1  ->
    fun lc  ->
      let uu____1357 =
        FStar_Syntax_Subst.subst subst1 lc.FStar_Syntax_Syntax.res_typ  in
      FStar_Syntax_Syntax.mk_lcomp lc.FStar_Syntax_Syntax.eff_name uu____1357
        lc.FStar_Syntax_Syntax.cflags
        (fun uu____1360  ->
           let uu____1361 = FStar_Syntax_Syntax.lcomp_comp lc  in
           FStar_Syntax_Subst.subst_comp subst1 uu____1361)
  
let (is_function : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun t  ->
    let uu____1367 =
      let uu____1368 = FStar_Syntax_Subst.compress t  in
      uu____1368.FStar_Syntax_Syntax.n  in
    match uu____1367 with
    | FStar_Syntax_Syntax.Tm_arrow uu____1371 -> true
    | uu____1386 -> false
  
let (label :
  Prims.string ->
    FStar_Range.range -> FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ)
  =
  fun reason  ->
    fun r  ->
      fun f  ->
        FStar_Syntax_Syntax.mk
          (FStar_Syntax_Syntax.Tm_meta
             (f, (FStar_Syntax_Syntax.Meta_labeled (reason, r, false))))
          FStar_Pervasives_Native.None f.FStar_Syntax_Syntax.pos
  
let (label_opt :
  FStar_TypeChecker_Env.env ->
    (unit -> Prims.string) FStar_Pervasives_Native.option ->
      FStar_Range.range -> FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ)
  =
  fun env  ->
    fun reason  ->
      fun r  ->
        fun f  ->
          match reason with
          | FStar_Pervasives_Native.None  -> f
          | FStar_Pervasives_Native.Some reason1 ->
              let uu____1443 =
                let uu____1444 = FStar_TypeChecker_Env.should_verify env  in
                FStar_All.pipe_left Prims.op_Negation uu____1444  in
              if uu____1443
              then f
              else (let uu____1446 = reason1 ()  in label uu____1446 r f)
  
let (label_guard :
  FStar_Range.range ->
    Prims.string ->
      FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t)
  =
  fun r  ->
    fun reason  ->
      fun g  ->
        match g.FStar_TypeChecker_Env.guard_f with
        | FStar_TypeChecker_Common.Trivial  -> g
        | FStar_TypeChecker_Common.NonTrivial f ->
            let uu___351_1463 = g  in
            let uu____1464 =
              let uu____1465 = label reason r f  in
              FStar_TypeChecker_Common.NonTrivial uu____1465  in
            {
              FStar_TypeChecker_Env.guard_f = uu____1464;
              FStar_TypeChecker_Env.deferred =
                (uu___351_1463.FStar_TypeChecker_Env.deferred);
              FStar_TypeChecker_Env.univ_ineqs =
                (uu___351_1463.FStar_TypeChecker_Env.univ_ineqs);
              FStar_TypeChecker_Env.implicits =
                (uu___351_1463.FStar_TypeChecker_Env.implicits)
            }
  
let (close_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.bv Prims.list ->
      FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun bvs  ->
      fun c  ->
        let uu____1485 = FStar_Syntax_Util.is_ml_comp c  in
        if uu____1485
        then c
        else
          (let uu____1487 =
             env.FStar_TypeChecker_Env.lax && (FStar_Options.ml_ish ())  in
           if uu____1487
           then c
           else
             (let close_wp u_res md res_t bvs1 wp0 =
                FStar_List.fold_right
                  (fun x  ->
                     fun wp  ->
                       let bs =
                         let uu____1548 = FStar_Syntax_Syntax.mk_binder x  in
                         [uu____1548]  in
                       let us =
                         let uu____1570 =
                           let uu____1573 =
                             env.FStar_TypeChecker_Env.universe_of env
                               x.FStar_Syntax_Syntax.sort
                              in
                           [uu____1573]  in
                         u_res :: uu____1570  in
                       let wp1 =
                         FStar_Syntax_Util.abs bs wp
                           (FStar_Pervasives_Native.Some
                              (FStar_Syntax_Util.mk_residual_comp
                                 FStar_Parser_Const.effect_Tot_lid
                                 FStar_Pervasives_Native.None
                                 [FStar_Syntax_Syntax.TOTAL]))
                          in
                       let uu____1579 =
                         let uu____1584 =
                           FStar_TypeChecker_Env.inst_effect_fun_with us env
                             md md.FStar_Syntax_Syntax.close_wp
                            in
                         let uu____1585 =
                           let uu____1586 = FStar_Syntax_Syntax.as_arg res_t
                              in
                           let uu____1595 =
                             let uu____1606 =
                               FStar_Syntax_Syntax.as_arg
                                 x.FStar_Syntax_Syntax.sort
                                in
                             let uu____1615 =
                               let uu____1626 =
                                 FStar_Syntax_Syntax.as_arg wp1  in
                               [uu____1626]  in
                             uu____1606 :: uu____1615  in
                           uu____1586 :: uu____1595  in
                         FStar_Syntax_Syntax.mk_Tm_app uu____1584 uu____1585
                          in
                       uu____1579 FStar_Pervasives_Native.None
                         wp0.FStar_Syntax_Syntax.pos) bvs1 wp0
                 in
              let c1 = FStar_TypeChecker_Env.unfold_effect_abbrev env c  in
              let uu____1670 = destruct_comp c1  in
              match uu____1670 with
              | (u_res_t,res_t,wp) ->
                  let md =
                    FStar_TypeChecker_Env.get_effect_decl env
                      c1.FStar_Syntax_Syntax.effect_name
                     in
                  let wp1 = close_wp u_res_t md res_t bvs wp  in
                  mk_comp md u_res_t c1.FStar_Syntax_Syntax.result_typ wp1
                    c1.FStar_Syntax_Syntax.flags))
  
let (close_lcomp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.bv Prims.list ->
      FStar_Syntax_Syntax.lcomp -> FStar_Syntax_Syntax.lcomp)
  =
  fun env  ->
    fun bvs  ->
      fun lc  ->
        FStar_Syntax_Syntax.mk_lcomp lc.FStar_Syntax_Syntax.eff_name
          lc.FStar_Syntax_Syntax.res_typ lc.FStar_Syntax_Syntax.cflags
          (fun uu____1705  ->
             let uu____1706 = FStar_Syntax_Syntax.lcomp_comp lc  in
             close_comp env bvs uu____1706)
  
let (should_not_inline_lc : FStar_Syntax_Syntax.lcomp -> Prims.bool) =
  fun lc  ->
    FStar_All.pipe_right lc.FStar_Syntax_Syntax.cflags
      (FStar_Util.for_some
         (fun uu___331_1715  ->
            match uu___331_1715 with
            | FStar_Syntax_Syntax.SHOULD_NOT_INLINE  -> true
            | uu____1716 -> false))
  
let (should_return :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
      FStar_Syntax_Syntax.lcomp -> Prims.bool)
  =
  fun env  ->
    fun eopt  ->
      fun lc  ->
        match eopt with
        | FStar_Pervasives_Native.None  -> false
        | FStar_Pervasives_Native.Some e ->
            (((FStar_Syntax_Util.is_pure_or_ghost_lcomp lc) &&
                (let uu____1738 =
                   FStar_Syntax_Util.is_unit lc.FStar_Syntax_Syntax.res_typ
                    in
                 Prims.op_Negation uu____1738))
               &&
               (let uu____1745 = FStar_Syntax_Util.head_and_args' e  in
                match uu____1745 with
                | (head1,uu____1761) ->
                    let uu____1782 =
                      let uu____1783 = FStar_Syntax_Util.un_uinst head1  in
                      uu____1783.FStar_Syntax_Syntax.n  in
                    (match uu____1782 with
                     | FStar_Syntax_Syntax.Tm_fvar fv ->
                         let uu____1787 =
                           let uu____1788 = FStar_Syntax_Syntax.lid_of_fv fv
                              in
                           FStar_TypeChecker_Env.is_irreducible env
                             uu____1788
                            in
                         Prims.op_Negation uu____1787
                     | uu____1789 -> true)))
              &&
              (let uu____1791 = should_not_inline_lc lc  in
               Prims.op_Negation uu____1791)
  
let (return_value :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
          FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun u_t_opt  ->
      fun t  ->
        fun v1  ->
          let c =
            let uu____1825 =
              let uu____1826 =
                FStar_TypeChecker_Env.lid_exists env
                  FStar_Parser_Const.effect_GTot_lid
                 in
              FStar_All.pipe_left Prims.op_Negation uu____1826  in
            if uu____1825
            then FStar_Syntax_Syntax.mk_Total t
            else
              (let uu____1828 = FStar_Syntax_Util.is_unit t  in
               if uu____1828
               then
                 FStar_Syntax_Syntax.mk_Total' t
                   (FStar_Pervasives_Native.Some FStar_Syntax_Syntax.U_zero)
               else
                 (let m =
                    FStar_TypeChecker_Env.get_effect_decl env
                      FStar_Parser_Const.effect_PURE_lid
                     in
                  let u_t =
                    match u_t_opt with
                    | FStar_Pervasives_Native.None  ->
                        env.FStar_TypeChecker_Env.universe_of env t
                    | FStar_Pervasives_Native.Some u_t -> u_t  in
                  let wp =
                    let uu____1834 =
                      env.FStar_TypeChecker_Env.lax &&
                        (FStar_Options.ml_ish ())
                       in
                    if uu____1834
                    then FStar_Syntax_Syntax.tun
                    else
                      (let uu____1836 =
                         FStar_TypeChecker_Env.wp_signature env
                           FStar_Parser_Const.effect_PURE_lid
                          in
                       match uu____1836 with
                       | (a,kwp) ->
                           let k =
                             FStar_Syntax_Subst.subst
                               [FStar_Syntax_Syntax.NT (a, t)] kwp
                              in
                           let uu____1846 =
                             let uu____1847 =
                               let uu____1852 =
                                 FStar_TypeChecker_Env.inst_effect_fun_with
                                   [u_t] env m m.FStar_Syntax_Syntax.ret_wp
                                  in
                               let uu____1853 =
                                 let uu____1854 =
                                   FStar_Syntax_Syntax.as_arg t  in
                                 let uu____1863 =
                                   let uu____1874 =
                                     FStar_Syntax_Syntax.as_arg v1  in
                                   [uu____1874]  in
                                 uu____1854 :: uu____1863  in
                               FStar_Syntax_Syntax.mk_Tm_app uu____1852
                                 uu____1853
                                in
                             uu____1847 FStar_Pervasives_Native.None
                               v1.FStar_Syntax_Syntax.pos
                              in
                           FStar_TypeChecker_Normalize.normalize
                             [FStar_TypeChecker_Env.Beta;
                             FStar_TypeChecker_Env.NoFullNorm] env uu____1846)
                     in
                  mk_comp m u_t t wp [FStar_Syntax_Syntax.RETURN]))
             in
          (let uu____1910 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "Return")
              in
           if uu____1910
           then
             let uu____1911 =
               FStar_Range.string_of_range v1.FStar_Syntax_Syntax.pos  in
             let uu____1912 = FStar_Syntax_Print.term_to_string v1  in
             let uu____1913 =
               FStar_TypeChecker_Normalize.comp_to_string env c  in
             FStar_Util.print3 "(%s) returning %s at comp type %s\n"
               uu____1911 uu____1912 uu____1913
           else ());
          c
  
let (weaken_flags :
  FStar_Syntax_Syntax.cflags Prims.list ->
    FStar_Syntax_Syntax.cflags Prims.list)
  =
  fun flags1  ->
    let uu____1926 =
      FStar_All.pipe_right flags1
        (FStar_Util.for_some
           (fun uu___332_1930  ->
              match uu___332_1930 with
              | FStar_Syntax_Syntax.SHOULD_NOT_INLINE  -> true
              | uu____1931 -> false))
       in
    if uu____1926
    then [FStar_Syntax_Syntax.SHOULD_NOT_INLINE]
    else
      FStar_All.pipe_right flags1
        (FStar_List.collect
           (fun uu___333_1940  ->
              match uu___333_1940 with
              | FStar_Syntax_Syntax.TOTAL  ->
                  [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
              | FStar_Syntax_Syntax.RETURN  ->
                  [FStar_Syntax_Syntax.PARTIAL_RETURN;
                  FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
              | f -> [f]))
  
let (weaken_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun c  ->
      fun formula  ->
        let uu____1959 = FStar_Syntax_Util.is_ml_comp c  in
        if uu____1959
        then c
        else
          (let c1 = FStar_TypeChecker_Env.unfold_effect_abbrev env c  in
           let uu____1962 = destruct_comp c1  in
           match uu____1962 with
           | (u_res_t,res_t,wp) ->
               let md =
                 FStar_TypeChecker_Env.get_effect_decl env
                   c1.FStar_Syntax_Syntax.effect_name
                  in
               let wp1 =
                 let uu____1976 =
                   let uu____1981 =
                     FStar_TypeChecker_Env.inst_effect_fun_with [u_res_t] env
                       md md.FStar_Syntax_Syntax.assume_p
                      in
                   let uu____1982 =
                     let uu____1983 = FStar_Syntax_Syntax.as_arg res_t  in
                     let uu____1992 =
                       let uu____2003 = FStar_Syntax_Syntax.as_arg formula
                          in
                       let uu____2012 =
                         let uu____2023 = FStar_Syntax_Syntax.as_arg wp  in
                         [uu____2023]  in
                       uu____2003 :: uu____2012  in
                     uu____1983 :: uu____1992  in
                   FStar_Syntax_Syntax.mk_Tm_app uu____1981 uu____1982  in
                 uu____1976 FStar_Pervasives_Native.None
                   wp.FStar_Syntax_Syntax.pos
                  in
               let uu____2066 = weaken_flags c1.FStar_Syntax_Syntax.flags  in
               mk_comp md u_res_t res_t wp1 uu____2066)
  
let (weaken_precondition :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.lcomp ->
      FStar_TypeChecker_Common.guard_formula -> FStar_Syntax_Syntax.lcomp)
  =
  fun env  ->
    fun lc  ->
      fun f  ->
        let weaken uu____2089 =
          let c = FStar_Syntax_Syntax.lcomp_comp lc  in
          let uu____2091 =
            env.FStar_TypeChecker_Env.lax && (FStar_Options.ml_ish ())  in
          if uu____2091
          then c
          else
            (match f with
             | FStar_TypeChecker_Common.Trivial  -> c
             | FStar_TypeChecker_Common.NonTrivial f1 -> weaken_comp env c f1)
           in
        let uu____2094 = weaken_flags lc.FStar_Syntax_Syntax.cflags  in
        FStar_Syntax_Syntax.mk_lcomp lc.FStar_Syntax_Syntax.eff_name
          lc.FStar_Syntax_Syntax.res_typ uu____2094 weaken
  
let (strengthen_comp :
  FStar_TypeChecker_Env.env ->
    (unit -> Prims.string) FStar_Pervasives_Native.option ->
      FStar_Syntax_Syntax.comp ->
        FStar_Syntax_Syntax.formula ->
          FStar_Syntax_Syntax.cflags Prims.list -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun reason  ->
      fun c  ->
        fun f  ->
          fun flags1  ->
            if env.FStar_TypeChecker_Env.lax
            then c
            else
              (let c1 = FStar_TypeChecker_Env.unfold_effect_abbrev env c  in
               let uu____2137 = destruct_comp c1  in
               match uu____2137 with
               | (u_res_t,res_t,wp) ->
                   let md =
                     FStar_TypeChecker_Env.get_effect_decl env
                       c1.FStar_Syntax_Syntax.effect_name
                      in
                   let wp1 =
                     let uu____2151 =
                       let uu____2156 =
                         FStar_TypeChecker_Env.inst_effect_fun_with [u_res_t]
                           env md md.FStar_Syntax_Syntax.assert_p
                          in
                       let uu____2157 =
                         let uu____2158 = FStar_Syntax_Syntax.as_arg res_t
                            in
                         let uu____2167 =
                           let uu____2178 =
                             let uu____2187 =
                               let uu____2188 =
                                 FStar_TypeChecker_Env.get_range env  in
                               label_opt env reason uu____2188 f  in
                             FStar_All.pipe_left FStar_Syntax_Syntax.as_arg
                               uu____2187
                              in
                           let uu____2197 =
                             let uu____2208 = FStar_Syntax_Syntax.as_arg wp
                                in
                             [uu____2208]  in
                           uu____2178 :: uu____2197  in
                         uu____2158 :: uu____2167  in
                       FStar_Syntax_Syntax.mk_Tm_app uu____2156 uu____2157
                        in
                     uu____2151 FStar_Pervasives_Native.None
                       wp.FStar_Syntax_Syntax.pos
                      in
                   mk_comp md u_res_t res_t wp1 flags1)
  
let (strengthen_precondition :
  (unit -> Prims.string) FStar_Pervasives_Native.option ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term ->
        FStar_Syntax_Syntax.lcomp ->
          FStar_TypeChecker_Env.guard_t ->
            (FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
              FStar_Pervasives_Native.tuple2)
  =
  fun reason  ->
    fun env  ->
      fun e_for_debug_only  ->
        fun lc  ->
          fun g0  ->
            let uu____2293 =
              FStar_TypeChecker_Env.is_trivial_guard_formula g0  in
            if uu____2293
            then (lc, g0)
            else
              (let flags1 =
                 let uu____2302 =
                   let uu____2309 = FStar_Syntax_Util.is_tot_or_gtot_lcomp lc
                      in
                   if uu____2309
                   then (true, [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION])
                   else (false, [])  in
                 match uu____2302 with
                 | (maybe_trivial_post,flags1) ->
                     let uu____2329 =
                       FStar_All.pipe_right lc.FStar_Syntax_Syntax.cflags
                         (FStar_List.collect
                            (fun uu___334_2337  ->
                               match uu___334_2337 with
                               | FStar_Syntax_Syntax.RETURN  ->
                                   [FStar_Syntax_Syntax.PARTIAL_RETURN]
                               | FStar_Syntax_Syntax.PARTIAL_RETURN  ->
                                   [FStar_Syntax_Syntax.PARTIAL_RETURN]
                               | FStar_Syntax_Syntax.SOMETRIVIAL  when
                                   Prims.op_Negation maybe_trivial_post ->
                                   [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
                               | FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION 
                                   when Prims.op_Negation maybe_trivial_post
                                   ->
                                   [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
                               | FStar_Syntax_Syntax.SHOULD_NOT_INLINE  ->
                                   [FStar_Syntax_Syntax.SHOULD_NOT_INLINE]
                               | uu____2340 -> []))
                        in
                     FStar_List.append flags1 uu____2329
                  in
               let strengthen uu____2346 =
                 let c = FStar_Syntax_Syntax.lcomp_comp lc  in
                 if env.FStar_TypeChecker_Env.lax
                 then c
                 else
                   (let g01 = FStar_TypeChecker_Rel.simplify_guard env g0  in
                    let uu____2350 = FStar_TypeChecker_Env.guard_form g01  in
                    match uu____2350 with
                    | FStar_TypeChecker_Common.Trivial  -> c
                    | FStar_TypeChecker_Common.NonTrivial f ->
                        ((let uu____2353 =
                            FStar_All.pipe_left
                              (FStar_TypeChecker_Env.debug env)
                              FStar_Options.Extreme
                             in
                          if uu____2353
                          then
                            let uu____2354 =
                              FStar_TypeChecker_Normalize.term_to_string env
                                e_for_debug_only
                               in
                            let uu____2355 =
                              FStar_TypeChecker_Normalize.term_to_string env
                                f
                               in
                            FStar_Util.print2
                              "-------------Strengthening pre-condition of term %s with guard %s\n"
                              uu____2354 uu____2355
                          else ());
                         strengthen_comp env reason c f flags1))
                  in
               let uu____2357 =
                 let uu____2358 =
                   FStar_TypeChecker_Env.norm_eff_name env
                     lc.FStar_Syntax_Syntax.eff_name
                    in
                 FStar_Syntax_Syntax.mk_lcomp uu____2358
                   lc.FStar_Syntax_Syntax.res_typ flags1 strengthen
                  in
               (uu____2357,
                 (let uu___352_2360 = g0  in
                  {
                    FStar_TypeChecker_Env.guard_f =
                      FStar_TypeChecker_Common.Trivial;
                    FStar_TypeChecker_Env.deferred =
                      (uu___352_2360.FStar_TypeChecker_Env.deferred);
                    FStar_TypeChecker_Env.univ_ineqs =
                      (uu___352_2360.FStar_TypeChecker_Env.univ_ineqs);
                    FStar_TypeChecker_Env.implicits =
                      (uu___352_2360.FStar_TypeChecker_Env.implicits)
                  })))
  
let (lcomp_has_trivial_postcondition :
  FStar_Syntax_Syntax.lcomp -> Prims.bool) =
  fun lc  ->
    (FStar_Syntax_Util.is_tot_or_gtot_lcomp lc) ||
      (FStar_Util.for_some
         (fun uu___335_2367  ->
            match uu___335_2367 with
            | FStar_Syntax_Syntax.SOMETRIVIAL  -> true
            | FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION  -> true
            | uu____2368 -> false) lc.FStar_Syntax_Syntax.cflags)
  
let (maybe_add_with_type :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option ->
      FStar_Syntax_Syntax.lcomp ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  =
  fun env  ->
    fun uopt  ->
      fun lc  ->
        fun e  ->
          let uu____2395 =
            (FStar_Syntax_Util.is_lcomp_partial_return lc) ||
              env.FStar_TypeChecker_Env.lax
             in
          if uu____2395
          then e
          else
            (let uu____2399 =
               (lcomp_has_trivial_postcondition lc) &&
                 (let uu____2401 =
                    FStar_TypeChecker_Env.try_lookup_lid env
                      FStar_Parser_Const.with_type_lid
                     in
                  FStar_Option.isSome uu____2401)
                in
             if uu____2399
             then
               let u =
                 match uopt with
                 | FStar_Pervasives_Native.Some u -> u
                 | FStar_Pervasives_Native.None  ->
                     env.FStar_TypeChecker_Env.universe_of env
                       lc.FStar_Syntax_Syntax.res_typ
                  in
               FStar_Syntax_Util.mk_with_type u
                 lc.FStar_Syntax_Syntax.res_typ e
             else e)
  
let (bind :
  FStar_Range.range ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
        FStar_Syntax_Syntax.lcomp ->
          lcomp_with_binder -> FStar_Syntax_Syntax.lcomp)
  =
  fun r1  ->
    fun env  ->
      fun e1opt  ->
        fun lc1  ->
          fun uu____2451  ->
            match uu____2451 with
            | (b,lc2) ->
                let debug1 f =
                  let uu____2471 =
                    (FStar_TypeChecker_Env.debug env FStar_Options.Extreme)
                      ||
                      (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                         (FStar_Options.Other "bind"))
                     in
                  if uu____2471 then f () else ()  in
                let lc11 =
                  FStar_TypeChecker_Normalize.ghost_to_pure_lcomp env lc1  in
                let lc21 =
                  FStar_TypeChecker_Normalize.ghost_to_pure_lcomp env lc2  in
                let joined_eff = join_lcomp env lc11 lc21  in
                let bind_flags =
                  let uu____2479 =
                    (should_not_inline_lc lc11) ||
                      (should_not_inline_lc lc21)
                     in
                  if uu____2479
                  then [FStar_Syntax_Syntax.SHOULD_NOT_INLINE]
                  else
                    (let flags1 =
                       let uu____2486 = FStar_Syntax_Util.is_total_lcomp lc11
                          in
                       if uu____2486
                       then
                         let uu____2489 =
                           FStar_Syntax_Util.is_total_lcomp lc21  in
                         (if uu____2489
                          then [FStar_Syntax_Syntax.TOTAL]
                          else
                            (let uu____2493 =
                               FStar_Syntax_Util.is_tot_or_gtot_lcomp lc21
                                in
                             if uu____2493
                             then [FStar_Syntax_Syntax.SOMETRIVIAL]
                             else []))
                       else
                         (let uu____2498 =
                            (FStar_Syntax_Util.is_tot_or_gtot_lcomp lc11) &&
                              (FStar_Syntax_Util.is_tot_or_gtot_lcomp lc21)
                             in
                          if uu____2498
                          then [FStar_Syntax_Syntax.SOMETRIVIAL]
                          else [])
                        in
                     let uu____2502 = lcomp_has_trivial_postcondition lc21
                        in
                     if uu____2502
                     then FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION :: flags1
                     else flags1)
                   in
                let bind_it uu____2511 =
                  let uu____2512 =
                    env.FStar_TypeChecker_Env.lax &&
                      (FStar_Options.ml_ish ())
                     in
                  if uu____2512
                  then
                    let u_t =
                      env.FStar_TypeChecker_Env.universe_of env
                        lc21.FStar_Syntax_Syntax.res_typ
                       in
                    lax_mk_tot_or_comp_l joined_eff u_t
                      lc21.FStar_Syntax_Syntax.res_typ []
                  else
                    (let c1 = FStar_Syntax_Syntax.lcomp_comp lc11  in
                     let c2 = FStar_Syntax_Syntax.lcomp_comp lc21  in
                     debug1
                       (fun uu____2526  ->
                          let uu____2527 =
                            FStar_Syntax_Print.comp_to_string c1  in
                          let uu____2528 =
                            match b with
                            | FStar_Pervasives_Native.None  -> "none"
                            | FStar_Pervasives_Native.Some x ->
                                FStar_Syntax_Print.bv_to_string x
                             in
                          let uu____2530 =
                            FStar_Syntax_Print.comp_to_string c2  in
                          FStar_Util.print3
                            "(1) bind: \n\tc1=%s\n\tx=%s\n\tc2=%s\n(1. end bind)\n"
                            uu____2527 uu____2528 uu____2530);
                     (let aux uu____2544 =
                        let uu____2545 = FStar_Syntax_Util.is_trivial_wp c1
                           in
                        if uu____2545
                        then
                          match b with
                          | FStar_Pervasives_Native.None  ->
                              FStar_Util.Inl (c2, "trivial no binder")
                          | FStar_Pervasives_Native.Some uu____2566 ->
                              let uu____2567 =
                                FStar_Syntax_Util.is_ml_comp c2  in
                              (if uu____2567
                               then FStar_Util.Inl (c2, "trivial ml")
                               else
                                 FStar_Util.Inr
                                   "c1 trivial; but c2 is not ML")
                        else
                          (let uu____2586 =
                             (FStar_Syntax_Util.is_ml_comp c1) &&
                               (FStar_Syntax_Util.is_ml_comp c2)
                              in
                           if uu____2586
                           then FStar_Util.Inl (c2, "both ml")
                           else
                             FStar_Util.Inr
                               "c1 not trivial, and both are not ML")
                         in
                      let subst_c2 e1opt1 reason =
                        match (e1opt1, b) with
                        | (FStar_Pervasives_Native.Some
                           e,FStar_Pervasives_Native.Some x) ->
                            let uu____2657 =
                              let uu____2662 =
                                FStar_Syntax_Subst.subst_comp
                                  [FStar_Syntax_Syntax.NT (x, e)] c2
                                 in
                              (uu____2662, reason)  in
                            FStar_Util.Inl uu____2657
                        | uu____2669 -> aux ()  in
                      let try_simplify uu____2693 =
                        let maybe_close t x c =
                          let t1 =
                            FStar_TypeChecker_Normalize.normalize_refinement
                              FStar_TypeChecker_Normalize.whnf_steps env t
                             in
                          match t1.FStar_Syntax_Syntax.n with
                          | FStar_Syntax_Syntax.Tm_refine
                              ({ FStar_Syntax_Syntax.ppname = uu____2711;
                                 FStar_Syntax_Syntax.index = uu____2712;
                                 FStar_Syntax_Syntax.sort =
                                   {
                                     FStar_Syntax_Syntax.n =
                                       FStar_Syntax_Syntax.Tm_fvar fv;
                                     FStar_Syntax_Syntax.pos = uu____2714;
                                     FStar_Syntax_Syntax.vars = uu____2715;_};_},uu____2716)
                              when
                              FStar_Syntax_Syntax.fv_eq_lid fv
                                FStar_Parser_Const.unit_lid
                              -> close_comp env [x] c
                          | uu____2723 -> c  in
                        let uu____2724 =
                          let uu____2725 =
                            FStar_TypeChecker_Env.try_lookup_effect_lid env
                              FStar_Parser_Const.effect_GTot_lid
                             in
                          FStar_Option.isNone uu____2725  in
                        if uu____2724
                        then
                          let uu____2736 =
                            (FStar_Syntax_Util.is_tot_or_gtot_comp c1) &&
                              (FStar_Syntax_Util.is_tot_or_gtot_comp c2)
                             in
                          (if uu____2736
                           then
                             FStar_Util.Inl
                               (c2, "Early in prims; we don't have bind yet")
                           else
                             (let uu____2750 =
                                FStar_TypeChecker_Env.get_range env  in
                              FStar_Errors.raise_error
                                (FStar_Errors.Fatal_NonTrivialPreConditionInPrims,
                                  "Non-trivial pre-conditions very early in prims, even before we have defined the PURE monad")
                                uu____2750))
                        else
                          (let uu____2760 =
                             (FStar_Syntax_Util.is_total_comp c1) &&
                               (FStar_Syntax_Util.is_total_comp c2)
                              in
                           if uu____2760
                           then subst_c2 e1opt "both total"
                           else
                             (let uu____2770 =
                                (FStar_Syntax_Util.is_tot_or_gtot_comp c1) &&
                                  (FStar_Syntax_Util.is_tot_or_gtot_comp c2)
                                 in
                              if uu____2770
                              then
                                let uu____2779 =
                                  let uu____2784 =
                                    FStar_Syntax_Syntax.mk_GTotal
                                      (FStar_Syntax_Util.comp_result c2)
                                     in
                                  (uu____2784, "both gtot")  in
                                FStar_Util.Inl uu____2779
                              else
                                (match (e1opt, b) with
                                 | (FStar_Pervasives_Native.Some
                                    e,FStar_Pervasives_Native.Some x) ->
                                     let uu____2808 =
                                       (FStar_Syntax_Util.is_total_comp c1)
                                         &&
                                         (let uu____2810 =
                                            FStar_Syntax_Syntax.is_null_bv x
                                             in
                                          Prims.op_Negation uu____2810)
                                        in
                                     if uu____2808
                                     then
                                       let c21 =
                                         FStar_Syntax_Subst.subst_comp
                                           [FStar_Syntax_Syntax.NT (x, e)] c2
                                          in
                                       let x1 =
                                         let uu___353_2823 = x  in
                                         {
                                           FStar_Syntax_Syntax.ppname =
                                             (uu___353_2823.FStar_Syntax_Syntax.ppname);
                                           FStar_Syntax_Syntax.index =
                                             (uu___353_2823.FStar_Syntax_Syntax.index);
                                           FStar_Syntax_Syntax.sort =
                                             (FStar_Syntax_Util.comp_result
                                                c1)
                                         }  in
                                       let uu____2824 =
                                         let uu____2829 =
                                           maybe_close
                                             x1.FStar_Syntax_Syntax.sort x1
                                             c21
                                            in
                                         (uu____2829, "c1 Tot")  in
                                       FStar_Util.Inl uu____2824
                                     else aux ()
                                 | uu____2835 -> aux ())))
                         in
                      let uu____2844 = try_simplify ()  in
                      match uu____2844 with
                      | FStar_Util.Inl (c,reason) ->
                          (debug1
                             (fun uu____2864  ->
                                let uu____2865 =
                                  FStar_Syntax_Print.comp_to_string c  in
                                FStar_Util.print2
                                  "(2) bind: Simplified (because %s) to\n\t%s\n"
                                  reason uu____2865);
                           c)
                      | FStar_Util.Inr reason ->
                          (debug1
                             (fun uu____2874  ->
                                FStar_Util.print1
                                  "(2) bind: Not simplified because %s\n"
                                  reason);
                           (let mk_bind c11 b1 c21 =
                              let uu____2895 = lift_and_destruct env c11 c21
                                 in
                              match uu____2895 with
                              | ((md,a,kwp),(u_t1,t1,wp1),(u_t2,t2,wp2)) ->
                                  let bs =
                                    match b1 with
                                    | FStar_Pervasives_Native.None  ->
                                        let uu____2948 =
                                          FStar_Syntax_Syntax.null_binder t1
                                           in
                                        [uu____2948]
                                    | FStar_Pervasives_Native.Some x ->
                                        let uu____2968 =
                                          FStar_Syntax_Syntax.mk_binder x  in
                                        [uu____2968]
                                     in
                                  let mk_lam wp =
                                    FStar_Syntax_Util.abs bs wp
                                      (FStar_Pervasives_Native.Some
                                         (FStar_Syntax_Util.mk_residual_comp
                                            FStar_Parser_Const.effect_Tot_lid
                                            FStar_Pervasives_Native.None
                                            [FStar_Syntax_Syntax.TOTAL]))
                                     in
                                  let r11 =
                                    FStar_Syntax_Syntax.mk
                                      (FStar_Syntax_Syntax.Tm_constant
                                         (FStar_Const.Const_range r1))
                                      FStar_Pervasives_Native.None r1
                                     in
                                  let wp_args =
                                    let uu____3015 =
                                      FStar_Syntax_Syntax.as_arg r11  in
                                    let uu____3024 =
                                      let uu____3035 =
                                        FStar_Syntax_Syntax.as_arg t1  in
                                      let uu____3044 =
                                        let uu____3055 =
                                          FStar_Syntax_Syntax.as_arg t2  in
                                        let uu____3064 =
                                          let uu____3075 =
                                            FStar_Syntax_Syntax.as_arg wp1
                                             in
                                          let uu____3084 =
                                            let uu____3095 =
                                              let uu____3104 = mk_lam wp2  in
                                              FStar_Syntax_Syntax.as_arg
                                                uu____3104
                                               in
                                            [uu____3095]  in
                                          uu____3075 :: uu____3084  in
                                        uu____3055 :: uu____3064  in
                                      uu____3035 :: uu____3044  in
                                    uu____3015 :: uu____3024  in
                                  let wp =
                                    let uu____3156 =
                                      let uu____3161 =
                                        FStar_TypeChecker_Env.inst_effect_fun_with
                                          [u_t1; u_t2] env md
                                          md.FStar_Syntax_Syntax.bind_wp
                                         in
                                      FStar_Syntax_Syntax.mk_Tm_app
                                        uu____3161 wp_args
                                       in
                                    uu____3156 FStar_Pervasives_Native.None
                                      t2.FStar_Syntax_Syntax.pos
                                     in
                                  mk_comp md u_t2 t2 wp bind_flags
                               in
                            let mk_seq c11 b1 c21 =
                              let c12 =
                                FStar_TypeChecker_Env.unfold_effect_abbrev
                                  env c11
                                 in
                              let c22 =
                                FStar_TypeChecker_Env.unfold_effect_abbrev
                                  env c21
                                 in
                              let uu____3186 =
                                FStar_TypeChecker_Env.join env
                                  c12.FStar_Syntax_Syntax.effect_name
                                  c22.FStar_Syntax_Syntax.effect_name
                                 in
                              match uu____3186 with
                              | (m,uu____3194,lift2) ->
                                  let c23 =
                                    let uu____3197 = lift_comp c22 m lift2
                                       in
                                    FStar_Syntax_Syntax.mk_Comp uu____3197
                                     in
                                  let uu____3198 = destruct_comp c12  in
                                  (match uu____3198 with
                                   | (u1,t1,wp1) ->
                                       let md_pure_or_ghost =
                                         FStar_TypeChecker_Env.get_effect_decl
                                           env
                                           c12.FStar_Syntax_Syntax.effect_name
                                          in
                                       let vc1 =
                                         let uu____3212 =
                                           let uu____3217 =
                                             FStar_TypeChecker_Env.inst_effect_fun_with
                                               [u1] env md_pure_or_ghost
                                               md_pure_or_ghost.FStar_Syntax_Syntax.trivial
                                              in
                                           let uu____3218 =
                                             let uu____3219 =
                                               FStar_Syntax_Syntax.as_arg t1
                                                in
                                             let uu____3228 =
                                               let uu____3239 =
                                                 FStar_Syntax_Syntax.as_arg
                                                   wp1
                                                  in
                                               [uu____3239]  in
                                             uu____3219 :: uu____3228  in
                                           FStar_Syntax_Syntax.mk_Tm_app
                                             uu____3217 uu____3218
                                            in
                                         uu____3212
                                           FStar_Pervasives_Native.None r1
                                          in
                                       strengthen_comp env
                                         FStar_Pervasives_Native.None c23 vc1
                                         bind_flags)
                               in
                            let c1_typ =
                              FStar_TypeChecker_Env.unfold_effect_abbrev env
                                c1
                               in
                            let uu____3278 = destruct_comp c1_typ  in
                            match uu____3278 with
                            | (u_res_t1,res_t1,uu____3287) ->
                                let uu____3288 =
                                  (FStar_Option.isSome b) &&
                                    (should_return env e1opt lc11)
                                   in
                                if uu____3288
                                then
                                  let e1 = FStar_Option.get e1opt  in
                                  let x = FStar_Option.get b  in
                                  let uu____3291 =
                                    FStar_Syntax_Util.is_partial_return c1
                                     in
                                  (if uu____3291
                                   then
                                     (debug1
                                        (fun uu____3299  ->
                                           let uu____3300 =
                                             FStar_TypeChecker_Normalize.term_to_string
                                               env e1
                                              in
                                           let uu____3301 =
                                             FStar_Syntax_Print.bv_to_string
                                               x
                                              in
                                           FStar_Util.print2
                                             "(3) bind (case a): Substituting %s for %s"
                                             uu____3300 uu____3301);
                                      (let c21 =
                                         FStar_Syntax_Subst.subst_comp
                                           [FStar_Syntax_Syntax.NT (x, e1)]
                                           c2
                                          in
                                       mk_bind c1 b c21))
                                   else
                                     (let uu____3306 =
                                        ((FStar_Options.vcgen_optimize_bind_as_seq
                                            ())
                                           &&
                                           (lcomp_has_trivial_postcondition
                                              lc11))
                                          &&
                                          (let uu____3308 =
                                             FStar_TypeChecker_Env.try_lookup_lid
                                               env
                                               FStar_Parser_Const.with_type_lid
                                              in
                                           FStar_Option.isSome uu____3308)
                                         in
                                      if uu____3306
                                      then
                                        let e1' =
                                          let uu____3328 =
                                            FStar_Options.vcgen_decorate_with_type
                                              ()
                                             in
                                          if uu____3328
                                          then
                                            FStar_Syntax_Util.mk_with_type
                                              u_res_t1 res_t1 e1
                                          else e1  in
                                        (debug1
                                           (fun uu____3337  ->
                                              let uu____3338 =
                                                FStar_TypeChecker_Normalize.term_to_string
                                                  env e1'
                                                 in
                                              let uu____3339 =
                                                FStar_Syntax_Print.bv_to_string
                                                  x
                                                 in
                                              FStar_Util.print2
                                                "(3) bind (case b): Substituting %s for %s"
                                                uu____3338 uu____3339);
                                         (let c21 =
                                            FStar_Syntax_Subst.subst_comp
                                              [FStar_Syntax_Syntax.NT
                                                 (x, e1')] c2
                                             in
                                          mk_seq c1 b c21))
                                      else
                                        (debug1
                                           (fun uu____3351  ->
                                              let uu____3352 =
                                                FStar_TypeChecker_Normalize.term_to_string
                                                  env e1
                                                 in
                                              let uu____3353 =
                                                FStar_Syntax_Print.bv_to_string
                                                  x
                                                 in
                                              FStar_Util.print2
                                                "(3) bind (case c): Adding equality %s = %s"
                                                uu____3352 uu____3353);
                                         (let c21 =
                                            FStar_Syntax_Subst.subst_comp
                                              [FStar_Syntax_Syntax.NT (x, e1)]
                                              c2
                                             in
                                          let x_eq_e =
                                            let uu____3358 =
                                              FStar_Syntax_Syntax.bv_to_name
                                                x
                                               in
                                            FStar_Syntax_Util.mk_eq2 u_res_t1
                                              res_t1 e1 uu____3358
                                             in
                                          let c22 =
                                            weaken_comp env c21 x_eq_e  in
                                          mk_bind c1 b c22))))
                                else mk_bind c1 b c2))))
                   in
                FStar_Syntax_Syntax.mk_lcomp joined_eff
                  lc21.FStar_Syntax_Syntax.res_typ bind_flags bind_it
  
let (weaken_guard :
  FStar_TypeChecker_Common.guard_formula ->
    FStar_TypeChecker_Common.guard_formula ->
      FStar_TypeChecker_Common.guard_formula)
  =
  fun g1  ->
    fun g2  ->
      match (g1, g2) with
      | (FStar_TypeChecker_Common.NonTrivial
         f1,FStar_TypeChecker_Common.NonTrivial f2) ->
          let g = FStar_Syntax_Util.mk_imp f1 f2  in
          FStar_TypeChecker_Common.NonTrivial g
      | uu____3374 -> g2
  
let (maybe_assume_result_eq_pure_term :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.lcomp -> FStar_Syntax_Syntax.lcomp)
  =
  fun env  ->
    fun e  ->
      fun lc  ->
        let should_return1 =
          (((Prims.op_Negation env.FStar_TypeChecker_Env.lax) &&
              (FStar_TypeChecker_Env.lid_exists env
                 FStar_Parser_Const.effect_GTot_lid))
             && (should_return env (FStar_Pervasives_Native.Some e) lc))
            &&
            (let uu____3396 = FStar_Syntax_Util.is_lcomp_partial_return lc
                in
             Prims.op_Negation uu____3396)
           in
        let flags1 =
          if should_return1
          then
            let uu____3402 = FStar_Syntax_Util.is_total_lcomp lc  in
            (if uu____3402
             then FStar_Syntax_Syntax.RETURN ::
               (lc.FStar_Syntax_Syntax.cflags)
             else FStar_Syntax_Syntax.PARTIAL_RETURN ::
               (lc.FStar_Syntax_Syntax.cflags))
          else lc.FStar_Syntax_Syntax.cflags  in
        let refine1 uu____3414 =
          let c = FStar_Syntax_Syntax.lcomp_comp lc  in
          let u_t =
            match comp_univ_opt c with
            | FStar_Pervasives_Native.Some u_t -> u_t
            | FStar_Pervasives_Native.None  ->
                env.FStar_TypeChecker_Env.universe_of env
                  (FStar_Syntax_Util.comp_result c)
             in
          let uu____3418 = FStar_Syntax_Util.is_tot_or_gtot_comp c  in
          if uu____3418
          then
            let retc =
              return_value env (FStar_Pervasives_Native.Some u_t)
                (FStar_Syntax_Util.comp_result c) e
               in
            let uu____3422 =
              let uu____3423 = FStar_Syntax_Util.is_pure_comp c  in
              Prims.op_Negation uu____3423  in
            (if uu____3422
             then
               let retc1 = FStar_Syntax_Util.comp_to_comp_typ retc  in
               let retc2 =
                 let uu___354_3428 = retc1  in
                 {
                   FStar_Syntax_Syntax.comp_univs =
                     (uu___354_3428.FStar_Syntax_Syntax.comp_univs);
                   FStar_Syntax_Syntax.effect_name =
                     FStar_Parser_Const.effect_GHOST_lid;
                   FStar_Syntax_Syntax.result_typ =
                     (uu___354_3428.FStar_Syntax_Syntax.result_typ);
                   FStar_Syntax_Syntax.effect_args =
                     (uu___354_3428.FStar_Syntax_Syntax.effect_args);
                   FStar_Syntax_Syntax.flags = flags1
                 }  in
               FStar_Syntax_Syntax.mk_Comp retc2
             else FStar_Syntax_Util.comp_set_flags retc flags1)
          else
            (let c1 = FStar_TypeChecker_Env.unfold_effect_abbrev env c  in
             let t = c1.FStar_Syntax_Syntax.result_typ  in
             let c2 = FStar_Syntax_Syntax.mk_Comp c1  in
             let x =
               FStar_Syntax_Syntax.new_bv
                 (FStar_Pervasives_Native.Some (t.FStar_Syntax_Syntax.pos)) t
                in
             let xexp = FStar_Syntax_Syntax.bv_to_name x  in
             let ret1 =
               let uu____3439 =
                 let uu____3440 =
                   return_value env (FStar_Pervasives_Native.Some u_t) t xexp
                    in
                 FStar_Syntax_Util.comp_set_flags uu____3440
                   [FStar_Syntax_Syntax.PARTIAL_RETURN]
                  in
               FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp uu____3439
                in
             let eq1 = FStar_Syntax_Util.mk_eq2 u_t t xexp e  in
             let eq_ret =
               weaken_precondition env ret1
                 (FStar_TypeChecker_Common.NonTrivial eq1)
                in
             let uu____3443 =
               let uu____3444 =
                 let uu____3445 = FStar_Syntax_Util.lcomp_of_comp c2  in
                 bind e.FStar_Syntax_Syntax.pos env
                   FStar_Pervasives_Native.None uu____3445
                   ((FStar_Pervasives_Native.Some x), eq_ret)
                  in
               FStar_Syntax_Syntax.lcomp_comp uu____3444  in
             FStar_Syntax_Util.comp_set_flags uu____3443 flags1)
           in
        if Prims.op_Negation should_return1
        then lc
        else
          FStar_Syntax_Syntax.mk_lcomp lc.FStar_Syntax_Syntax.eff_name
            lc.FStar_Syntax_Syntax.res_typ flags1 refine1
  
let (maybe_return_e2_and_bind :
  FStar_Range.range ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
        FStar_Syntax_Syntax.lcomp ->
          FStar_Syntax_Syntax.term ->
            lcomp_with_binder -> FStar_Syntax_Syntax.lcomp)
  =
  fun r  ->
    fun env  ->
      fun e1opt  ->
        fun lc1  ->
          fun e2  ->
            fun uu____3480  ->
              match uu____3480 with
              | (x,lc2) ->
                  let lc21 =
                    let eff1 =
                      FStar_TypeChecker_Env.norm_eff_name env
                        lc1.FStar_Syntax_Syntax.eff_name
                       in
                    let eff2 =
                      FStar_TypeChecker_Env.norm_eff_name env
                        lc2.FStar_Syntax_Syntax.eff_name
                       in
                    let uu____3492 =
                      ((let uu____3495 = is_pure_or_ghost_effect env eff1  in
                        Prims.op_Negation uu____3495) ||
                         (should_not_inline_lc lc1))
                        && (is_pure_or_ghost_effect env eff2)
                       in
                    if uu____3492
                    then maybe_assume_result_eq_pure_term env e2 lc2
                    else lc2  in
                  bind r env e1opt lc1 (x, lc21)
  
let (fvar_const :
  FStar_TypeChecker_Env.env -> FStar_Ident.lident -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun lid  ->
      let uu____3509 =
        let uu____3510 = FStar_TypeChecker_Env.get_range env  in
        FStar_Ident.set_lid_range lid uu____3510  in
      FStar_Syntax_Syntax.fvar uu____3509 FStar_Syntax_Syntax.delta_constant
        FStar_Pervasives_Native.None
  
let (bind_cases :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      (FStar_Syntax_Syntax.typ,FStar_Ident.lident,FStar_Syntax_Syntax.cflags
                                                    Prims.list,Prims.bool ->
                                                                 FStar_Syntax_Syntax.lcomp)
        FStar_Pervasives_Native.tuple4 Prims.list ->
        FStar_Syntax_Syntax.lcomp)
  =
  fun env  ->
    fun res_t  ->
      fun lcases  ->
        let eff =
          FStar_List.fold_left
            (fun eff  ->
               fun uu____3576  ->
                 match uu____3576 with
                 | (uu____3589,eff_label,uu____3591,uu____3592) ->
                     join_effects env eff eff_label)
            FStar_Parser_Const.effect_PURE_lid lcases
           in
        let uu____3603 =
          let uu____3610 =
            FStar_All.pipe_right lcases
              (FStar_Util.for_some
                 (fun uu____3644  ->
                    match uu____3644 with
                    | (uu____3657,uu____3658,flags1,uu____3660) ->
                        FStar_All.pipe_right flags1
                          (FStar_Util.for_some
                             (fun uu___336_3674  ->
                                match uu___336_3674 with
                                | FStar_Syntax_Syntax.SHOULD_NOT_INLINE  ->
                                    true
                                | uu____3675 -> false))))
             in
          if uu____3610
          then (true, [FStar_Syntax_Syntax.SHOULD_NOT_INLINE])
          else (false, [])  in
        match uu____3603 with
        | (should_not_inline_whole_match,bind_cases_flags) ->
            let bind_cases uu____3698 =
              let u_res_t = env.FStar_TypeChecker_Env.universe_of env res_t
                 in
              let uu____3700 =
                env.FStar_TypeChecker_Env.lax && (FStar_Options.ml_ish ())
                 in
              if uu____3700
              then lax_mk_tot_or_comp_l eff u_res_t res_t []
              else
                (let ifthenelse md res_t1 g wp_t wp_e =
                   let uu____3738 =
                     FStar_Range.union_ranges wp_t.FStar_Syntax_Syntax.pos
                       wp_e.FStar_Syntax_Syntax.pos
                      in
                   let uu____3739 =
                     let uu____3744 =
                       FStar_TypeChecker_Env.inst_effect_fun_with [u_res_t]
                         env md md.FStar_Syntax_Syntax.if_then_else
                        in
                     let uu____3745 =
                       let uu____3746 = FStar_Syntax_Syntax.as_arg res_t1  in
                       let uu____3755 =
                         let uu____3766 = FStar_Syntax_Syntax.as_arg g  in
                         let uu____3775 =
                           let uu____3786 = FStar_Syntax_Syntax.as_arg wp_t
                              in
                           let uu____3795 =
                             let uu____3806 = FStar_Syntax_Syntax.as_arg wp_e
                                in
                             [uu____3806]  in
                           uu____3786 :: uu____3795  in
                         uu____3766 :: uu____3775  in
                       uu____3746 :: uu____3755  in
                     FStar_Syntax_Syntax.mk_Tm_app uu____3744 uu____3745  in
                   uu____3739 FStar_Pervasives_Native.None uu____3738  in
                 let default_case =
                   let post_k =
                     let uu____3861 =
                       let uu____3870 = FStar_Syntax_Syntax.null_binder res_t
                          in
                       [uu____3870]  in
                     let uu____3889 =
                       FStar_Syntax_Syntax.mk_Total FStar_Syntax_Util.ktype0
                        in
                     FStar_Syntax_Util.arrow uu____3861 uu____3889  in
                   let kwp =
                     let uu____3895 =
                       let uu____3904 =
                         FStar_Syntax_Syntax.null_binder post_k  in
                       [uu____3904]  in
                     let uu____3923 =
                       FStar_Syntax_Syntax.mk_Total FStar_Syntax_Util.ktype0
                        in
                     FStar_Syntax_Util.arrow uu____3895 uu____3923  in
                   let post =
                     FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None
                       post_k
                      in
                   let wp =
                     let uu____3930 =
                       let uu____3931 = FStar_Syntax_Syntax.mk_binder post
                          in
                       [uu____3931]  in
                     let uu____3950 =
                       let uu____3953 =
                         let uu____3960 = FStar_TypeChecker_Env.get_range env
                            in
                         label FStar_TypeChecker_Err.exhaustiveness_check
                           uu____3960
                          in
                       let uu____3961 =
                         fvar_const env FStar_Parser_Const.false_lid  in
                       FStar_All.pipe_left uu____3953 uu____3961  in
                     FStar_Syntax_Util.abs uu____3930 uu____3950
                       (FStar_Pervasives_Native.Some
                          (FStar_Syntax_Util.mk_residual_comp
                             FStar_Parser_Const.effect_Tot_lid
                             FStar_Pervasives_Native.None
                             [FStar_Syntax_Syntax.TOTAL]))
                      in
                   let md =
                     FStar_TypeChecker_Env.get_effect_decl env
                       FStar_Parser_Const.effect_PURE_lid
                      in
                   mk_comp md u_res_t res_t wp []  in
                 let maybe_return eff_label_then cthen =
                   let uu____3983 =
                     should_not_inline_whole_match ||
                       (let uu____3985 = is_pure_or_ghost_effect env eff  in
                        Prims.op_Negation uu____3985)
                      in
                   if uu____3983 then cthen true else cthen false  in
                 let comp =
                   FStar_List.fold_right
                     (fun uu____4018  ->
                        fun celse  ->
                          match uu____4018 with
                          | (g,eff_label,uu____4034,cthen) ->
                              let uu____4046 =
                                let uu____4071 =
                                  let uu____4072 =
                                    maybe_return eff_label cthen  in
                                  FStar_Syntax_Syntax.lcomp_comp uu____4072
                                   in
                                lift_and_destruct env uu____4071 celse  in
                              (match uu____4046 with
                               | ((md,uu____4074,uu____4075),(uu____4076,uu____4077,wp_then),
                                  (uu____4079,uu____4080,wp_else)) ->
                                   let uu____4100 =
                                     ifthenelse md res_t g wp_then wp_else
                                      in
                                   mk_comp md u_res_t res_t uu____4100 []))
                     lcases default_case
                    in
                 match lcases with
                 | [] -> comp
                 | uu____4114::[] -> comp
                 | uu____4154 ->
                     let comp1 =
                       FStar_TypeChecker_Env.comp_to_comp_typ env comp  in
                     let md =
                       FStar_TypeChecker_Env.get_effect_decl env
                         comp1.FStar_Syntax_Syntax.effect_name
                        in
                     let uu____4172 = destruct_comp comp1  in
                     (match uu____4172 with
                      | (uu____4179,uu____4180,wp) ->
                          let wp1 =
                            let uu____4185 =
                              let uu____4190 =
                                FStar_TypeChecker_Env.inst_effect_fun_with
                                  [u_res_t] env md
                                  md.FStar_Syntax_Syntax.ite_wp
                                 in
                              let uu____4191 =
                                let uu____4192 =
                                  FStar_Syntax_Syntax.as_arg res_t  in
                                let uu____4201 =
                                  let uu____4212 =
                                    FStar_Syntax_Syntax.as_arg wp  in
                                  [uu____4212]  in
                                uu____4192 :: uu____4201  in
                              FStar_Syntax_Syntax.mk_Tm_app uu____4190
                                uu____4191
                               in
                            uu____4185 FStar_Pervasives_Native.None
                              wp.FStar_Syntax_Syntax.pos
                             in
                          mk_comp md u_res_t res_t wp1 bind_cases_flags))
               in
            FStar_Syntax_Syntax.mk_lcomp eff res_t bind_cases_flags
              bind_cases
  
let (check_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.comp ->
        FStar_Syntax_Syntax.comp ->
          (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.comp,FStar_TypeChecker_Env.guard_t)
            FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun e  ->
      fun c  ->
        fun c'  ->
          let uu____4279 = FStar_TypeChecker_Rel.sub_comp env c c'  in
          match uu____4279 with
          | FStar_Pervasives_Native.None  ->
              if env.FStar_TypeChecker_Env.use_eq
              then
                let uu____4294 =
                  FStar_TypeChecker_Err.computed_computation_type_does_not_match_annotation_eq
                    env e c c'
                   in
                let uu____4299 = FStar_TypeChecker_Env.get_range env  in
                FStar_Errors.raise_error uu____4294 uu____4299
              else
                (let uu____4307 =
                   FStar_TypeChecker_Err.computed_computation_type_does_not_match_annotation
                     env e c c'
                    in
                 let uu____4312 = FStar_TypeChecker_Env.get_range env  in
                 FStar_Errors.raise_error uu____4307 uu____4312)
          | FStar_Pervasives_Native.Some g -> (e, c', g)
  
let (maybe_coerce_bool_to_type :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.lcomp ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp)
            FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun e  ->
      fun lc  ->
        fun t  ->
          if env.FStar_TypeChecker_Env.is_pattern
          then (e, lc)
          else
            (let is_type1 t1 =
               let t2 = FStar_TypeChecker_Normalize.unfold_whnf env t1  in
               let uu____4356 =
                 let uu____4357 = FStar_Syntax_Subst.compress t2  in
                 uu____4357.FStar_Syntax_Syntax.n  in
               match uu____4356 with
               | FStar_Syntax_Syntax.Tm_type uu____4360 -> true
               | uu____4361 -> false  in
             let uu____4362 =
               let uu____4363 =
                 FStar_Syntax_Util.unrefine lc.FStar_Syntax_Syntax.res_typ
                  in
               uu____4363.FStar_Syntax_Syntax.n  in
             match uu____4362 with
             | FStar_Syntax_Syntax.Tm_fvar fv when
                 (FStar_Syntax_Syntax.fv_eq_lid fv
                    FStar_Parser_Const.bool_lid)
                   && (is_type1 t)
                 ->
                 let uu____4371 =
                   FStar_TypeChecker_Env.lookup_lid env
                     FStar_Parser_Const.b2t_lid
                    in
                 let b2t1 =
                   let uu____4381 =
                     FStar_Ident.set_lid_range FStar_Parser_Const.b2t_lid
                       e.FStar_Syntax_Syntax.pos
                      in
                   FStar_Syntax_Syntax.fvar uu____4381
                     (FStar_Syntax_Syntax.Delta_constant_at_level
                        (Prims.parse_int "1")) FStar_Pervasives_Native.None
                    in
                 let lc1 =
                   let uu____4383 =
                     let uu____4384 =
                       let uu____4385 =
                         FStar_Syntax_Syntax.mk_Total
                           FStar_Syntax_Util.ktype0
                          in
                       FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp
                         uu____4385
                        in
                     (FStar_Pervasives_Native.None, uu____4384)  in
                   bind e.FStar_Syntax_Syntax.pos env
                     (FStar_Pervasives_Native.Some e) lc uu____4383
                    in
                 let e1 =
                   let uu____4391 =
                     let uu____4396 =
                       let uu____4397 = FStar_Syntax_Syntax.as_arg e  in
                       [uu____4397]  in
                     FStar_Syntax_Syntax.mk_Tm_app b2t1 uu____4396  in
                   uu____4391 FStar_Pervasives_Native.None
                     e.FStar_Syntax_Syntax.pos
                    in
                 (e1, lc1)
             | uu____4424 -> (e, lc))
  
let (weaken_result_typ :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.lcomp ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
            FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun e  ->
      fun lc  ->
        fun t  ->
          (let uu____4458 =
             FStar_TypeChecker_Env.debug env FStar_Options.High  in
           if uu____4458
           then
             let uu____4459 = FStar_Syntax_Print.term_to_string e  in
             let uu____4460 = FStar_Syntax_Print.lcomp_to_string lc  in
             let uu____4461 = FStar_Syntax_Print.term_to_string t  in
             FStar_Util.print3 "weaken_result_typ e=(%s) lc=(%s) t=(%s)\n"
               uu____4459 uu____4460 uu____4461
           else ());
          (let use_eq =
             env.FStar_TypeChecker_Env.use_eq ||
               (let uu____4467 =
                  FStar_TypeChecker_Env.effect_decl_opt env
                    lc.FStar_Syntax_Syntax.eff_name
                   in
                match uu____4467 with
                | FStar_Pervasives_Native.Some (ed,qualifiers) ->
                    FStar_All.pipe_right qualifiers
                      (FStar_List.contains FStar_Syntax_Syntax.Reifiable)
                | uu____4490 -> false)
              in
           let gopt =
             if use_eq
             then
               let uu____4512 =
                 FStar_TypeChecker_Rel.try_teq true env
                   lc.FStar_Syntax_Syntax.res_typ t
                  in
               (uu____4512, false)
             else
               (let uu____4518 =
                  FStar_TypeChecker_Rel.get_subtyping_predicate env
                    lc.FStar_Syntax_Syntax.res_typ t
                   in
                (uu____4518, true))
              in
           match gopt with
           | (FStar_Pervasives_Native.None ,uu____4529) ->
               if env.FStar_TypeChecker_Env.failhard
               then
                 let uu____4538 =
                   FStar_TypeChecker_Err.basic_type_error env
                     (FStar_Pervasives_Native.Some e) t
                     lc.FStar_Syntax_Syntax.res_typ
                    in
                 FStar_Errors.raise_error uu____4538
                   e.FStar_Syntax_Syntax.pos
               else
                 (FStar_TypeChecker_Rel.subtype_fail env e
                    lc.FStar_Syntax_Syntax.res_typ t;
                  (e,
                    ((let uu___355_4552 = lc  in
                      {
                        FStar_Syntax_Syntax.eff_name =
                          (uu___355_4552.FStar_Syntax_Syntax.eff_name);
                        FStar_Syntax_Syntax.res_typ = t;
                        FStar_Syntax_Syntax.cflags =
                          (uu___355_4552.FStar_Syntax_Syntax.cflags);
                        FStar_Syntax_Syntax.comp_thunk =
                          (uu___355_4552.FStar_Syntax_Syntax.comp_thunk)
                      })), FStar_TypeChecker_Env.trivial_guard))
           | (FStar_Pervasives_Native.Some g,apply_guard1) ->
               let uu____4557 = FStar_TypeChecker_Env.guard_form g  in
               (match uu____4557 with
                | FStar_TypeChecker_Common.Trivial  ->
                    let uu____4564 = FStar_Syntax_Util.set_result_typ_lc lc t
                       in
                    (e, uu____4564, g)
                | FStar_TypeChecker_Common.NonTrivial f ->
                    let g1 =
                      let uu___356_4567 = g  in
                      {
                        FStar_TypeChecker_Env.guard_f =
                          FStar_TypeChecker_Common.Trivial;
                        FStar_TypeChecker_Env.deferred =
                          (uu___356_4567.FStar_TypeChecker_Env.deferred);
                        FStar_TypeChecker_Env.univ_ineqs =
                          (uu___356_4567.FStar_TypeChecker_Env.univ_ineqs);
                        FStar_TypeChecker_Env.implicits =
                          (uu___356_4567.FStar_TypeChecker_Env.implicits)
                      }  in
                    let strengthen uu____4573 =
                      let uu____4574 =
                        env.FStar_TypeChecker_Env.lax &&
                          (FStar_Options.ml_ish ())
                         in
                      if uu____4574
                      then FStar_Syntax_Syntax.lcomp_comp lc
                      else
                        (let f1 =
                           FStar_TypeChecker_Normalize.normalize
                             [FStar_TypeChecker_Env.Beta;
                             FStar_TypeChecker_Env.Eager_unfolding;
                             FStar_TypeChecker_Env.Simplify;
                             FStar_TypeChecker_Env.Primops] env f
                            in
                         let uu____4577 =
                           let uu____4578 = FStar_Syntax_Subst.compress f1
                              in
                           uu____4578.FStar_Syntax_Syntax.n  in
                         match uu____4577 with
                         | FStar_Syntax_Syntax.Tm_abs
                             (uu____4581,{
                                           FStar_Syntax_Syntax.n =
                                             FStar_Syntax_Syntax.Tm_fvar fv;
                                           FStar_Syntax_Syntax.pos =
                                             uu____4583;
                                           FStar_Syntax_Syntax.vars =
                                             uu____4584;_},uu____4585)
                             when
                             FStar_Syntax_Syntax.fv_eq_lid fv
                               FStar_Parser_Const.true_lid
                             ->
                             let lc1 =
                               let uu___357_4611 = lc  in
                               {
                                 FStar_Syntax_Syntax.eff_name =
                                   (uu___357_4611.FStar_Syntax_Syntax.eff_name);
                                 FStar_Syntax_Syntax.res_typ = t;
                                 FStar_Syntax_Syntax.cflags =
                                   (uu___357_4611.FStar_Syntax_Syntax.cflags);
                                 FStar_Syntax_Syntax.comp_thunk =
                                   (uu___357_4611.FStar_Syntax_Syntax.comp_thunk)
                               }  in
                             FStar_Syntax_Syntax.lcomp_comp lc1
                         | uu____4612 ->
                             let c = FStar_Syntax_Syntax.lcomp_comp lc  in
                             ((let uu____4615 =
                                 FStar_All.pipe_left
                                   (FStar_TypeChecker_Env.debug env)
                                   FStar_Options.Extreme
                                  in
                               if uu____4615
                               then
                                 let uu____4616 =
                                   FStar_TypeChecker_Normalize.term_to_string
                                     env lc.FStar_Syntax_Syntax.res_typ
                                    in
                                 let uu____4617 =
                                   FStar_TypeChecker_Normalize.term_to_string
                                     env t
                                    in
                                 let uu____4618 =
                                   FStar_TypeChecker_Normalize.comp_to_string
                                     env c
                                    in
                                 let uu____4619 =
                                   FStar_TypeChecker_Normalize.term_to_string
                                     env f1
                                    in
                                 FStar_Util.print4
                                   "Weakened from %s to %s\nStrengthening %s with guard %s\n"
                                   uu____4616 uu____4617 uu____4618
                                   uu____4619
                               else ());
                              (let u_t_opt = comp_univ_opt c  in
                               let x =
                                 FStar_Syntax_Syntax.new_bv
                                   (FStar_Pervasives_Native.Some
                                      (t.FStar_Syntax_Syntax.pos)) t
                                  in
                               let xexp = FStar_Syntax_Syntax.bv_to_name x
                                  in
                               let cret = return_value env u_t_opt t xexp  in
                               let guard =
                                 if apply_guard1
                                 then
                                   let uu____4628 =
                                     let uu____4633 =
                                       let uu____4634 =
                                         FStar_Syntax_Syntax.as_arg xexp  in
                                       [uu____4634]  in
                                     FStar_Syntax_Syntax.mk_Tm_app f1
                                       uu____4633
                                      in
                                   uu____4628 FStar_Pervasives_Native.None
                                     f1.FStar_Syntax_Syntax.pos
                                 else f1  in
                               let uu____4662 =
                                 let uu____4667 =
                                   FStar_All.pipe_left
                                     (fun _0_16  ->
                                        FStar_Pervasives_Native.Some _0_16)
                                     (FStar_TypeChecker_Err.subtyping_failed
                                        env lc.FStar_Syntax_Syntax.res_typ t)
                                    in
                                 let uu____4684 =
                                   FStar_TypeChecker_Env.set_range env
                                     e.FStar_Syntax_Syntax.pos
                                    in
                                 let uu____4685 =
                                   FStar_Syntax_Util.lcomp_of_comp cret  in
                                 let uu____4686 =
                                   FStar_All.pipe_left
                                     FStar_TypeChecker_Env.guard_of_guard_formula
                                     (FStar_TypeChecker_Common.NonTrivial
                                        guard)
                                    in
                                 strengthen_precondition uu____4667
                                   uu____4684 e uu____4685 uu____4686
                                  in
                               match uu____4662 with
                               | (eq_ret,_trivial_so_ok_to_discard) ->
                                   let x1 =
                                     let uu___358_4690 = x  in
                                     {
                                       FStar_Syntax_Syntax.ppname =
                                         (uu___358_4690.FStar_Syntax_Syntax.ppname);
                                       FStar_Syntax_Syntax.index =
                                         (uu___358_4690.FStar_Syntax_Syntax.index);
                                       FStar_Syntax_Syntax.sort =
                                         (lc.FStar_Syntax_Syntax.res_typ)
                                     }  in
                                   let c1 =
                                     let uu____4692 =
                                       FStar_Syntax_Util.lcomp_of_comp c  in
                                     bind e.FStar_Syntax_Syntax.pos env
                                       (FStar_Pervasives_Native.Some e)
                                       uu____4692
                                       ((FStar_Pervasives_Native.Some x1),
                                         eq_ret)
                                      in
                                   let c2 = FStar_Syntax_Syntax.lcomp_comp c1
                                      in
                                   ((let uu____4697 =
                                       FStar_All.pipe_left
                                         (FStar_TypeChecker_Env.debug env)
                                         FStar_Options.Extreme
                                        in
                                     if uu____4697
                                     then
                                       let uu____4698 =
                                         FStar_TypeChecker_Normalize.comp_to_string
                                           env c2
                                          in
                                       FStar_Util.print1
                                         "Strengthened to %s\n" uu____4698
                                     else ());
                                    c2))))
                       in
                    let flags1 =
                      FStar_All.pipe_right lc.FStar_Syntax_Syntax.cflags
                        (FStar_List.collect
                           (fun uu___337_4708  ->
                              match uu___337_4708 with
                              | FStar_Syntax_Syntax.RETURN  ->
                                  [FStar_Syntax_Syntax.PARTIAL_RETURN]
                              | FStar_Syntax_Syntax.PARTIAL_RETURN  ->
                                  [FStar_Syntax_Syntax.PARTIAL_RETURN]
                              | FStar_Syntax_Syntax.CPS  ->
                                  [FStar_Syntax_Syntax.CPS]
                              | uu____4711 -> []))
                       in
                    let lc1 =
                      let uu____4713 =
                        FStar_TypeChecker_Env.norm_eff_name env
                          lc.FStar_Syntax_Syntax.eff_name
                         in
                      FStar_Syntax_Syntax.mk_lcomp uu____4713 t flags1
                        strengthen
                       in
                    let g2 =
                      let uu___359_4715 = g1  in
                      {
                        FStar_TypeChecker_Env.guard_f =
                          FStar_TypeChecker_Common.Trivial;
                        FStar_TypeChecker_Env.deferred =
                          (uu___359_4715.FStar_TypeChecker_Env.deferred);
                        FStar_TypeChecker_Env.univ_ineqs =
                          (uu___359_4715.FStar_TypeChecker_Env.univ_ineqs);
                        FStar_TypeChecker_Env.implicits =
                          (uu___359_4715.FStar_TypeChecker_Env.implicits)
                      }  in
                    (e, lc1, g2)))
  
let (pure_or_ghost_pre_and_post :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      (FStar_Syntax_Syntax.typ FStar_Pervasives_Native.option,FStar_Syntax_Syntax.typ)
        FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun comp  ->
      let mk_post_type res_t ens =
        let x = FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None res_t
           in
        let uu____4750 =
          let uu____4753 =
            let uu____4758 =
              let uu____4759 =
                let uu____4768 = FStar_Syntax_Syntax.bv_to_name x  in
                FStar_Syntax_Syntax.as_arg uu____4768  in
              [uu____4759]  in
            FStar_Syntax_Syntax.mk_Tm_app ens uu____4758  in
          uu____4753 FStar_Pervasives_Native.None
            res_t.FStar_Syntax_Syntax.pos
           in
        FStar_Syntax_Util.refine x uu____4750  in
      let norm1 t =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Env.Beta;
          FStar_TypeChecker_Env.Eager_unfolding;
          FStar_TypeChecker_Env.EraseUniverses] env t
         in
      let uu____4793 = FStar_Syntax_Util.is_tot_or_gtot_comp comp  in
      if uu____4793
      then
        (FStar_Pervasives_Native.None, (FStar_Syntax_Util.comp_result comp))
      else
        (match comp.FStar_Syntax_Syntax.n with
         | FStar_Syntax_Syntax.GTotal uu____4809 -> failwith "Impossible"
         | FStar_Syntax_Syntax.Total uu____4824 -> failwith "Impossible"
         | FStar_Syntax_Syntax.Comp ct ->
             let uu____4840 =
               (FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name
                  FStar_Parser_Const.effect_Pure_lid)
                 ||
                 (FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name
                    FStar_Parser_Const.effect_Ghost_lid)
                in
             if uu____4840
             then
               (match ct.FStar_Syntax_Syntax.effect_args with
                | (req,uu____4854)::(ens,uu____4856)::uu____4857 ->
                    let uu____4900 =
                      let uu____4903 = norm1 req  in
                      FStar_Pervasives_Native.Some uu____4903  in
                    let uu____4904 =
                      let uu____4905 =
                        mk_post_type ct.FStar_Syntax_Syntax.result_typ ens
                         in
                      FStar_All.pipe_left norm1 uu____4905  in
                    (uu____4900, uu____4904)
                | uu____4908 ->
                    let uu____4919 =
                      let uu____4924 =
                        let uu____4925 =
                          FStar_Syntax_Print.comp_to_string comp  in
                        FStar_Util.format1
                          "Effect constructor is not fully applied; got %s"
                          uu____4925
                         in
                      (FStar_Errors.Fatal_EffectConstructorNotFullyApplied,
                        uu____4924)
                       in
                    FStar_Errors.raise_error uu____4919
                      comp.FStar_Syntax_Syntax.pos)
             else
               (let ct1 = FStar_TypeChecker_Env.unfold_effect_abbrev env comp
                   in
                match ct1.FStar_Syntax_Syntax.effect_args with
                | (wp,uu____4941)::uu____4942 ->
                    let uu____4969 =
                      let uu____4974 =
                        FStar_TypeChecker_Env.lookup_lid env
                          FStar_Parser_Const.as_requires
                         in
                      FStar_All.pipe_left FStar_Pervasives_Native.fst
                        uu____4974
                       in
                    (match uu____4969 with
                     | (us_r,uu____5006) ->
                         let uu____5007 =
                           let uu____5012 =
                             FStar_TypeChecker_Env.lookup_lid env
                               FStar_Parser_Const.as_ensures
                              in
                           FStar_All.pipe_left FStar_Pervasives_Native.fst
                             uu____5012
                            in
                         (match uu____5007 with
                          | (us_e,uu____5044) ->
                              let r =
                                (ct1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos
                                 in
                              let as_req =
                                let uu____5047 =
                                  let uu____5048 =
                                    FStar_Ident.set_lid_range
                                      FStar_Parser_Const.as_requires r
                                     in
                                  FStar_Syntax_Syntax.fvar uu____5048
                                    FStar_Syntax_Syntax.delta_equational
                                    FStar_Pervasives_Native.None
                                   in
                                FStar_Syntax_Syntax.mk_Tm_uinst uu____5047
                                  us_r
                                 in
                              let as_ens =
                                let uu____5050 =
                                  let uu____5051 =
                                    FStar_Ident.set_lid_range
                                      FStar_Parser_Const.as_ensures r
                                     in
                                  FStar_Syntax_Syntax.fvar uu____5051
                                    FStar_Syntax_Syntax.delta_equational
                                    FStar_Pervasives_Native.None
                                   in
                                FStar_Syntax_Syntax.mk_Tm_uinst uu____5050
                                  us_e
                                 in
                              let req =
                                let uu____5055 =
                                  let uu____5060 =
                                    let uu____5061 =
                                      let uu____5072 =
                                        FStar_Syntax_Syntax.as_arg wp  in
                                      [uu____5072]  in
                                    ((ct1.FStar_Syntax_Syntax.result_typ),
                                      (FStar_Pervasives_Native.Some
                                         FStar_Syntax_Syntax.imp_tag))
                                      :: uu____5061
                                     in
                                  FStar_Syntax_Syntax.mk_Tm_app as_req
                                    uu____5060
                                   in
                                uu____5055 FStar_Pervasives_Native.None
                                  (ct1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos
                                 in
                              let ens =
                                let uu____5114 =
                                  let uu____5119 =
                                    let uu____5120 =
                                      let uu____5131 =
                                        FStar_Syntax_Syntax.as_arg wp  in
                                      [uu____5131]  in
                                    ((ct1.FStar_Syntax_Syntax.result_typ),
                                      (FStar_Pervasives_Native.Some
                                         FStar_Syntax_Syntax.imp_tag))
                                      :: uu____5120
                                     in
                                  FStar_Syntax_Syntax.mk_Tm_app as_ens
                                    uu____5119
                                   in
                                uu____5114 FStar_Pervasives_Native.None
                                  (ct1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos
                                 in
                              let uu____5170 =
                                let uu____5173 = norm1 req  in
                                FStar_Pervasives_Native.Some uu____5173  in
                              let uu____5174 =
                                let uu____5175 =
                                  mk_post_type
                                    ct1.FStar_Syntax_Syntax.result_typ ens
                                   in
                                norm1 uu____5175  in
                              (uu____5170, uu____5174)))
                | uu____5178 -> failwith "Impossible"))
  
let (reify_body :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t  ->
      let tm = FStar_Syntax_Util.mk_reify t  in
      let tm' =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Env.Beta;
          FStar_TypeChecker_Env.Reify;
          FStar_TypeChecker_Env.Eager_unfolding;
          FStar_TypeChecker_Env.EraseUniverses;
          FStar_TypeChecker_Env.AllowUnboundUniverses] env tm
         in
      (let uu____5210 =
         FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
           (FStar_Options.Other "SMTEncodingReify")
          in
       if uu____5210
       then
         let uu____5211 = FStar_Syntax_Print.term_to_string tm  in
         let uu____5212 = FStar_Syntax_Print.term_to_string tm'  in
         FStar_Util.print2 "Reified body %s \nto %s\n" uu____5211 uu____5212
       else ());
      tm'
  
let (reify_body_with_arg :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.arg -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun head1  ->
      fun arg  ->
        let tm =
          FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (head1, [arg]))
            FStar_Pervasives_Native.None head1.FStar_Syntax_Syntax.pos
           in
        let tm' =
          FStar_TypeChecker_Normalize.normalize
            [FStar_TypeChecker_Env.Beta;
            FStar_TypeChecker_Env.Reify;
            FStar_TypeChecker_Env.Eager_unfolding;
            FStar_TypeChecker_Env.EraseUniverses;
            FStar_TypeChecker_Env.AllowUnboundUniverses] env tm
           in
        (let uu____5262 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "SMTEncodingReify")
            in
         if uu____5262
         then
           let uu____5263 = FStar_Syntax_Print.term_to_string tm  in
           let uu____5264 = FStar_Syntax_Print.term_to_string tm'  in
           FStar_Util.print2 "Reified body %s \nto %s\n" uu____5263
             uu____5264
         else ());
        tm'
  
let (remove_reify : FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun t  ->
    let uu____5271 =
      let uu____5272 =
        let uu____5273 = FStar_Syntax_Subst.compress t  in
        uu____5273.FStar_Syntax_Syntax.n  in
      match uu____5272 with
      | FStar_Syntax_Syntax.Tm_app uu____5276 -> false
      | uu____5293 -> true  in
    if uu____5271
    then t
    else
      (let uu____5295 = FStar_Syntax_Util.head_and_args t  in
       match uu____5295 with
       | (head1,args) ->
           let uu____5338 =
             let uu____5339 =
               let uu____5340 = FStar_Syntax_Subst.compress head1  in
               uu____5340.FStar_Syntax_Syntax.n  in
             match uu____5339 with
             | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify ) ->
                 true
             | uu____5343 -> false  in
           if uu____5338
           then
             (match args with
              | x::[] -> FStar_Pervasives_Native.fst x
              | uu____5373 ->
                  failwith
                    "Impossible : Reify applied to multiple arguments after normalization.")
           else t)
  
let (maybe_instantiate :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ ->
        (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.typ,FStar_TypeChecker_Env.guard_t)
          FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun e  ->
      fun t  ->
        let torig = FStar_Syntax_Subst.compress t  in
        if Prims.op_Negation env.FStar_TypeChecker_Env.instantiate_imp
        then (e, torig, FStar_TypeChecker_Env.trivial_guard)
        else
          ((let uu____5415 =
              FStar_TypeChecker_Env.debug env FStar_Options.High  in
            if uu____5415
            then
              let uu____5416 = FStar_Syntax_Print.term_to_string e  in
              let uu____5417 = FStar_Syntax_Print.term_to_string t  in
              let uu____5418 =
                let uu____5419 = FStar_TypeChecker_Env.expected_typ env  in
                FStar_Common.string_of_option
                  FStar_Syntax_Print.term_to_string uu____5419
                 in
              FStar_Util.print3
                "maybe_instantiate: starting check for (%s) of type (%s), expected type is %s\n"
                uu____5416 uu____5417 uu____5418
            else ());
           (let number_of_implicits t1 =
              let uu____5429 = FStar_Syntax_Util.arrow_formals t1  in
              match uu____5429 with
              | (formals,uu____5445) ->
                  let n_implicits =
                    let uu____5467 =
                      FStar_All.pipe_right formals
                        (FStar_Util.prefix_until
                           (fun uu____5545  ->
                              match uu____5545 with
                              | (uu____5552,imp) ->
                                  (FStar_Option.isNone imp) ||
                                    (let uu____5559 =
                                       FStar_Syntax_Util.eq_aqual imp
                                         (FStar_Pervasives_Native.Some
                                            FStar_Syntax_Syntax.Equality)
                                        in
                                     uu____5559 = FStar_Syntax_Util.Equal)))
                       in
                    match uu____5467 with
                    | FStar_Pervasives_Native.None  ->
                        FStar_List.length formals
                    | FStar_Pervasives_Native.Some
                        (implicits,_first_explicit,_rest) ->
                        FStar_List.length implicits
                     in
                  n_implicits
               in
            let inst_n_binders t1 =
              let uu____5685 = FStar_TypeChecker_Env.expected_typ env  in
              match uu____5685 with
              | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
              | FStar_Pervasives_Native.Some expected_t ->
                  let n_expected = number_of_implicits expected_t  in
                  let n_available = number_of_implicits t1  in
                  if n_available < n_expected
                  then
                    let uu____5709 =
                      let uu____5714 =
                        let uu____5715 = FStar_Util.string_of_int n_expected
                           in
                        let uu____5722 = FStar_Syntax_Print.term_to_string e
                           in
                        let uu____5723 = FStar_Util.string_of_int n_available
                           in
                        FStar_Util.format3
                          "Expected a term with %s implicit arguments, but %s has only %s"
                          uu____5715 uu____5722 uu____5723
                         in
                      (FStar_Errors.Fatal_MissingImplicitArguments,
                        uu____5714)
                       in
                    let uu____5730 = FStar_TypeChecker_Env.get_range env  in
                    FStar_Errors.raise_error uu____5709 uu____5730
                  else
                    FStar_Pervasives_Native.Some (n_available - n_expected)
               in
            let decr_inst uu___338_5753 =
              match uu___338_5753 with
              | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
              | FStar_Pervasives_Native.Some i ->
                  FStar_Pervasives_Native.Some (i - (Prims.parse_int "1"))
               in
            match torig.FStar_Syntax_Syntax.n with
            | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
                let uu____5787 = FStar_Syntax_Subst.open_comp bs c  in
                (match uu____5787 with
                 | (bs1,c1) ->
                     let rec aux subst1 inst_n bs2 =
                       match (inst_n, bs2) with
                       | (FStar_Pervasives_Native.Some _0_17,uu____5902) when
                           _0_17 = (Prims.parse_int "0") ->
                           ([], bs2, subst1,
                             FStar_TypeChecker_Env.trivial_guard)
                       | (uu____5945,(x,FStar_Pervasives_Native.Some
                                      (FStar_Syntax_Syntax.Implicit dot))::rest)
                           ->
                           let t1 =
                             FStar_Syntax_Subst.subst subst1
                               x.FStar_Syntax_Syntax.sort
                              in
                           let uu____5978 =
                             new_implicit_var
                               "Instantiation of implicit argument"
                               e.FStar_Syntax_Syntax.pos env t1
                              in
                           (match uu____5978 with
                            | (v1,uu____6018,g) ->
                                ((let uu____6033 =
                                    FStar_TypeChecker_Env.debug env
                                      FStar_Options.High
                                     in
                                  if uu____6033
                                  then
                                    let uu____6034 =
                                      FStar_Syntax_Print.term_to_string v1
                                       in
                                    FStar_Util.print1
                                      "maybe_instantiate: Instantiating implicit with %s\n"
                                      uu____6034
                                  else ());
                                 (let subst2 =
                                    (FStar_Syntax_Syntax.NT (x, v1)) ::
                                    subst1  in
                                  let uu____6041 =
                                    aux subst2 (decr_inst inst_n) rest  in
                                  match uu____6041 with
                                  | (args,bs3,subst3,g') ->
                                      let uu____6134 =
                                        FStar_TypeChecker_Env.conj_guard g g'
                                         in
                                      (((v1,
                                          (FStar_Pervasives_Native.Some
                                             (FStar_Syntax_Syntax.Implicit
                                                dot))) :: args), bs3, subst3,
                                        uu____6134))))
                       | (uu____6161,(x,FStar_Pervasives_Native.Some
                                      (FStar_Syntax_Syntax.Meta tau))::rest)
                           ->
                           let t1 =
                             FStar_Syntax_Subst.subst subst1
                               x.FStar_Syntax_Syntax.sort
                              in
                           let uu____6196 =
                             new_implicit_var
                               "Instantiation of meta argument"
                               e.FStar_Syntax_Syntax.pos env t1
                              in
                           (match uu____6196 with
                            | (v1,uu____6236,g) ->
                                ((let uu____6251 =
                                    FStar_TypeChecker_Env.debug env
                                      FStar_Options.High
                                     in
                                  if uu____6251
                                  then
                                    let uu____6252 =
                                      FStar_Syntax_Print.term_to_string v1
                                       in
                                    FStar_Util.print1
                                      "maybe_instantiate: Instantiating meta argument with %s\n"
                                      uu____6252
                                  else ());
                                 (let mark_meta_implicits tau1 g1 =
                                    let uu___360_6265 = g1  in
                                    let uu____6266 =
                                      FStar_List.map
                                        (fun imp  ->
                                           let uu___361_6272 = imp  in
                                           {
                                             FStar_TypeChecker_Env.imp_reason
                                               =
                                               (uu___361_6272.FStar_TypeChecker_Env.imp_reason);
                                             FStar_TypeChecker_Env.imp_uvar =
                                               (uu___361_6272.FStar_TypeChecker_Env.imp_uvar);
                                             FStar_TypeChecker_Env.imp_tm =
                                               (uu___361_6272.FStar_TypeChecker_Env.imp_tm);
                                             FStar_TypeChecker_Env.imp_range
                                               =
                                               (uu___361_6272.FStar_TypeChecker_Env.imp_range);
                                             FStar_TypeChecker_Env.imp_meta =
                                               (FStar_Pervasives_Native.Some
                                                  (env, tau1))
                                           })
                                        g1.FStar_TypeChecker_Env.implicits
                                       in
                                    {
                                      FStar_TypeChecker_Env.guard_f =
                                        (uu___360_6265.FStar_TypeChecker_Env.guard_f);
                                      FStar_TypeChecker_Env.deferred =
                                        (uu___360_6265.FStar_TypeChecker_Env.deferred);
                                      FStar_TypeChecker_Env.univ_ineqs =
                                        (uu___360_6265.FStar_TypeChecker_Env.univ_ineqs);
                                      FStar_TypeChecker_Env.implicits =
                                        uu____6266
                                    }  in
                                  let g1 = mark_meta_implicits tau g  in
                                  let subst2 =
                                    (FStar_Syntax_Syntax.NT (x, v1)) ::
                                    subst1  in
                                  let uu____6283 =
                                    aux subst2 (decr_inst inst_n) rest  in
                                  match uu____6283 with
                                  | (args,bs3,subst3,g') ->
                                      let uu____6376 =
                                        FStar_TypeChecker_Env.conj_guard g1
                                          g'
                                         in
                                      (((v1,
                                          (FStar_Pervasives_Native.Some
                                             FStar_Syntax_Syntax.imp_tag)) ::
                                        args), bs3, subst3, uu____6376))))
                       | (uu____6403,bs3) ->
                           ([], bs3, subst1,
                             FStar_TypeChecker_Env.trivial_guard)
                        in
                     let uu____6449 =
                       let uu____6476 = inst_n_binders t  in
                       aux [] uu____6476 bs1  in
                     (match uu____6449 with
                      | (args,bs2,subst1,guard) ->
                          (match (args, bs2) with
                           | ([],uu____6547) -> (e, torig, guard)
                           | (uu____6578,[]) when
                               let uu____6609 =
                                 FStar_Syntax_Util.is_total_comp c1  in
                               Prims.op_Negation uu____6609 ->
                               (e, torig,
                                 FStar_TypeChecker_Env.trivial_guard)
                           | uu____6610 ->
                               let t1 =
                                 match bs2 with
                                 | [] -> FStar_Syntax_Util.comp_result c1
                                 | uu____6638 ->
                                     FStar_Syntax_Util.arrow bs2 c1
                                  in
                               let t2 = FStar_Syntax_Subst.subst subst1 t1
                                  in
                               let e1 =
                                 FStar_Syntax_Syntax.mk_Tm_app e args
                                   FStar_Pervasives_Native.None
                                   e.FStar_Syntax_Syntax.pos
                                  in
                               (e1, t2, guard))))
            | uu____6651 -> (e, t, FStar_TypeChecker_Env.trivial_guard)))
  
let (string_of_univs :
  FStar_Syntax_Syntax.universe_uvar FStar_Util.set -> Prims.string) =
  fun univs1  ->
    let uu____6661 =
      let uu____6664 = FStar_Util.set_elements univs1  in
      FStar_All.pipe_right uu____6664
        (FStar_List.map
           (fun u  ->
              let uu____6674 = FStar_Syntax_Unionfind.univ_uvar_id u  in
              FStar_All.pipe_right uu____6674 FStar_Util.string_of_int))
       in
    FStar_All.pipe_right uu____6661 (FStar_String.concat ", ")
  
let (gen_univs :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe_uvar FStar_Util.set ->
      FStar_Syntax_Syntax.univ_name Prims.list)
  =
  fun env  ->
    fun x  ->
      let uu____6695 = FStar_Util.set_is_empty x  in
      if uu____6695
      then []
      else
        (let s =
           let uu____6710 =
             let uu____6713 = FStar_TypeChecker_Env.univ_vars env  in
             FStar_Util.set_difference x uu____6713  in
           FStar_All.pipe_right uu____6710 FStar_Util.set_elements  in
         (let uu____6729 =
            FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
              (FStar_Options.Other "Gen")
             in
          if uu____6729
          then
            let uu____6730 =
              let uu____6731 = FStar_TypeChecker_Env.univ_vars env  in
              string_of_univs uu____6731  in
            FStar_Util.print1 "univ_vars in env: %s\n" uu____6730
          else ());
         (let r =
            let uu____6738 = FStar_TypeChecker_Env.get_range env  in
            FStar_Pervasives_Native.Some uu____6738  in
          let u_names =
            FStar_All.pipe_right s
              (FStar_List.map
                 (fun u  ->
                    let u_name = FStar_Syntax_Syntax.new_univ_name r  in
                    (let uu____6777 =
                       FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                         (FStar_Options.Other "Gen")
                        in
                     if uu____6777
                     then
                       let uu____6778 =
                         let uu____6779 =
                           FStar_Syntax_Unionfind.univ_uvar_id u  in
                         FStar_All.pipe_left FStar_Util.string_of_int
                           uu____6779
                          in
                       let uu____6780 =
                         FStar_Syntax_Print.univ_to_string
                           (FStar_Syntax_Syntax.U_unif u)
                          in
                       let uu____6781 =
                         FStar_Syntax_Print.univ_to_string
                           (FStar_Syntax_Syntax.U_name u_name)
                          in
                       FStar_Util.print3 "Setting ?%s (%s) to %s\n"
                         uu____6778 uu____6780 uu____6781
                     else ());
                    FStar_Syntax_Unionfind.univ_change u
                      (FStar_Syntax_Syntax.U_name u_name);
                    u_name))
             in
          u_names))
  
let (gather_free_univnames :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.univ_name Prims.list)
  =
  fun env  ->
    fun t  ->
      let ctx_univnames = FStar_TypeChecker_Env.univnames env  in
      let tm_univnames = FStar_Syntax_Free.univnames t  in
      let univnames1 =
        let uu____6807 = FStar_Util.set_difference tm_univnames ctx_univnames
           in
        FStar_All.pipe_right uu____6807 FStar_Util.set_elements  in
      univnames1
  
let (check_universe_generalization :
  FStar_Syntax_Syntax.univ_name Prims.list ->
    FStar_Syntax_Syntax.univ_name Prims.list ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.univ_name Prims.list)
  =
  fun explicit_univ_names  ->
    fun generalized_univ_names  ->
      fun t  ->
        match (explicit_univ_names, generalized_univ_names) with
        | ([],uu____6845) -> generalized_univ_names
        | (uu____6852,[]) -> explicit_univ_names
        | uu____6859 ->
            let uu____6868 =
              let uu____6873 =
                let uu____6874 = FStar_Syntax_Print.term_to_string t  in
                Prims.strcat
                  "Generalized universe in a term containing explicit universe annotation : "
                  uu____6874
                 in
              (FStar_Errors.Fatal_UnexpectedGeneralizedUniverse, uu____6873)
               in
            FStar_Errors.raise_error uu____6868 t.FStar_Syntax_Syntax.pos
  
let (generalize_universes :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.tscheme)
  =
  fun env  ->
    fun t0  ->
      let t =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Env.NoFullNorm;
          FStar_TypeChecker_Env.Beta;
          FStar_TypeChecker_Env.DoNotUnfoldPureLets] env t0
         in
      let univnames1 = gather_free_univnames env t  in
      (let uu____6892 =
         FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
           (FStar_Options.Other "Gen")
          in
       if uu____6892
       then
         let uu____6893 = FStar_Syntax_Print.term_to_string t  in
         let uu____6894 = FStar_Syntax_Print.univ_names_to_string univnames1
            in
         FStar_Util.print2
           "generalizing universes in the term (post norm): %s with univnames: %s\n"
           uu____6893 uu____6894
       else ());
      (let univs1 = FStar_Syntax_Free.univs t  in
       (let uu____6900 =
          FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
            (FStar_Options.Other "Gen")
           in
        if uu____6900
        then
          let uu____6901 = string_of_univs univs1  in
          FStar_Util.print1 "univs to gen : %s\n" uu____6901
        else ());
       (let gen1 = gen_univs env univs1  in
        (let uu____6907 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Gen")
            in
         if uu____6907
         then
           let uu____6908 = FStar_Syntax_Print.term_to_string t  in
           let uu____6909 = FStar_Syntax_Print.univ_names_to_string gen1  in
           FStar_Util.print2 "After generalization, t: %s and univs: %s\n"
             uu____6908 uu____6909
         else ());
        (let univs2 = check_universe_generalization univnames1 gen1 t0  in
         let t1 = FStar_TypeChecker_Normalize.reduce_uvar_solutions env t  in
         let ts = FStar_Syntax_Subst.close_univ_vars univs2 t1  in
         (univs2, ts))))
  
let (gen :
  FStar_TypeChecker_Env.env ->
    Prims.bool ->
      (FStar_Syntax_Syntax.lbname,FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.comp)
        FStar_Pervasives_Native.tuple3 Prims.list ->
        (FStar_Syntax_Syntax.lbname,FStar_Syntax_Syntax.univ_name Prims.list,
          FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.comp,FStar_Syntax_Syntax.binder
                                                              Prims.list)
          FStar_Pervasives_Native.tuple5 Prims.list
          FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun is_rec  ->
      fun lecs  ->
        let uu____6987 =
          let uu____6988 =
            FStar_Util.for_all
              (fun uu____7001  ->
                 match uu____7001 with
                 | (uu____7010,uu____7011,c) ->
                     FStar_Syntax_Util.is_pure_or_ghost_comp c) lecs
             in
          FStar_All.pipe_left Prims.op_Negation uu____6988  in
        if uu____6987
        then FStar_Pervasives_Native.None
        else
          (let norm1 c =
             (let uu____7059 =
                FStar_TypeChecker_Env.debug env FStar_Options.Medium  in
              if uu____7059
              then
                let uu____7060 = FStar_Syntax_Print.comp_to_string c  in
                FStar_Util.print1 "Normalizing before generalizing:\n\t %s\n"
                  uu____7060
              else ());
             (let c1 =
                FStar_TypeChecker_Normalize.normalize_comp
                  [FStar_TypeChecker_Env.Beta;
                  FStar_TypeChecker_Env.Exclude FStar_TypeChecker_Env.Zeta;
                  FStar_TypeChecker_Env.NoFullNorm;
                  FStar_TypeChecker_Env.DoNotUnfoldPureLets] env c
                 in
              (let uu____7064 =
                 FStar_TypeChecker_Env.debug env FStar_Options.Medium  in
               if uu____7064
               then
                 let uu____7065 = FStar_Syntax_Print.comp_to_string c1  in
                 FStar_Util.print1 "Normalized to:\n\t %s\n" uu____7065
               else ());
              c1)
              in
           let env_uvars = FStar_TypeChecker_Env.uvars_in_env env  in
           let gen_uvars uvs =
             let uu____7080 = FStar_Util.set_difference uvs env_uvars  in
             FStar_All.pipe_right uu____7080 FStar_Util.set_elements  in
           let univs_and_uvars_of_lec uu____7114 =
             match uu____7114 with
             | (lbname,e,c) ->
                 let c1 = norm1 c  in
                 let t = FStar_Syntax_Util.comp_result c1  in
                 let univs1 = FStar_Syntax_Free.univs t  in
                 let uvt = FStar_Syntax_Free.uvars t  in
                 ((let uu____7151 =
                     FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                       (FStar_Options.Other "Gen")
                      in
                   if uu____7151
                   then
                     let uu____7152 =
                       let uu____7153 =
                         let uu____7156 = FStar_Util.set_elements univs1  in
                         FStar_All.pipe_right uu____7156
                           (FStar_List.map
                              (fun u  ->
                                 FStar_Syntax_Print.univ_to_string
                                   (FStar_Syntax_Syntax.U_unif u)))
                          in
                       FStar_All.pipe_right uu____7153
                         (FStar_String.concat ", ")
                        in
                     let uu____7199 =
                       let uu____7200 =
                         let uu____7203 = FStar_Util.set_elements uvt  in
                         FStar_All.pipe_right uu____7203
                           (FStar_List.map
                              (fun u  ->
                                 let uu____7214 =
                                   FStar_Syntax_Print.uvar_to_string
                                     u.FStar_Syntax_Syntax.ctx_uvar_head
                                    in
                                 let uu____7215 =
                                   FStar_Syntax_Print.term_to_string
                                     u.FStar_Syntax_Syntax.ctx_uvar_typ
                                    in
                                 FStar_Util.format2 "(%s : %s)" uu____7214
                                   uu____7215))
                          in
                       FStar_All.pipe_right uu____7200
                         (FStar_String.concat ", ")
                        in
                     FStar_Util.print2
                       "^^^^\n\tFree univs = %s\n\tFree uvt=%s\n" uu____7152
                       uu____7199
                   else ());
                  (let univs2 =
                     let uu____7222 = FStar_Util.set_elements uvt  in
                     FStar_List.fold_left
                       (fun univs2  ->
                          fun uv  ->
                            let uu____7234 =
                              FStar_Syntax_Free.univs
                                uv.FStar_Syntax_Syntax.ctx_uvar_typ
                               in
                            FStar_Util.set_union univs2 uu____7234) univs1
                       uu____7222
                      in
                   let uvs = gen_uvars uvt  in
                   (let uu____7241 =
                      FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                        (FStar_Options.Other "Gen")
                       in
                    if uu____7241
                    then
                      let uu____7242 =
                        let uu____7243 =
                          let uu____7246 = FStar_Util.set_elements univs2  in
                          FStar_All.pipe_right uu____7246
                            (FStar_List.map
                               (fun u  ->
                                  FStar_Syntax_Print.univ_to_string
                                    (FStar_Syntax_Syntax.U_unif u)))
                           in
                        FStar_All.pipe_right uu____7243
                          (FStar_String.concat ", ")
                         in
                      let uu____7289 =
                        let uu____7290 =
                          FStar_All.pipe_right uvs
                            (FStar_List.map
                               (fun u  ->
                                  let uu____7301 =
                                    FStar_Syntax_Print.uvar_to_string
                                      u.FStar_Syntax_Syntax.ctx_uvar_head
                                     in
                                  let uu____7302 =
                                    FStar_TypeChecker_Normalize.term_to_string
                                      env u.FStar_Syntax_Syntax.ctx_uvar_typ
                                     in
                                  FStar_Util.format2 "(%s : %s)" uu____7301
                                    uu____7302))
                           in
                        FStar_All.pipe_right uu____7290
                          (FStar_String.concat ", ")
                         in
                      FStar_Util.print2
                        "^^^^\n\tFree univs = %s\n\tgen_uvars =%s" uu____7242
                        uu____7289
                    else ());
                   (univs2, uvs, (lbname, e, c1))))
              in
           let uu____7316 =
             let uu____7333 = FStar_List.hd lecs  in
             univs_and_uvars_of_lec uu____7333  in
           match uu____7316 with
           | (univs1,uvs,lec_hd) ->
               let force_univs_eq lec2 u1 u2 =
                 let uu____7423 =
                   (FStar_Util.set_is_subset_of u1 u2) &&
                     (FStar_Util.set_is_subset_of u2 u1)
                    in
                 if uu____7423
                 then ()
                 else
                   (let uu____7425 = lec_hd  in
                    match uu____7425 with
                    | (lb1,uu____7433,uu____7434) ->
                        let uu____7435 = lec2  in
                        (match uu____7435 with
                         | (lb2,uu____7443,uu____7444) ->
                             let msg =
                               let uu____7446 =
                                 FStar_Syntax_Print.lbname_to_string lb1  in
                               let uu____7447 =
                                 FStar_Syntax_Print.lbname_to_string lb2  in
                               FStar_Util.format2
                                 "Generalizing the types of these mutually recursive definitions requires an incompatible set of universes for %s and %s"
                                 uu____7446 uu____7447
                                in
                             let uu____7448 =
                               FStar_TypeChecker_Env.get_range env  in
                             FStar_Errors.raise_error
                               (FStar_Errors.Fatal_IncompatibleSetOfUniverse,
                                 msg) uu____7448))
                  in
               let force_uvars_eq lec2 u1 u2 =
                 let uvars_subseteq u11 u21 =
                   FStar_All.pipe_right u11
                     (FStar_Util.for_all
                        (fun u  ->
                           FStar_All.pipe_right u21
                             (FStar_Util.for_some
                                (fun u'  ->
                                   FStar_Syntax_Unionfind.equiv
                                     u.FStar_Syntax_Syntax.ctx_uvar_head
                                     u'.FStar_Syntax_Syntax.ctx_uvar_head))))
                    in
                 let uu____7512 =
                   (uvars_subseteq u1 u2) && (uvars_subseteq u2 u1)  in
                 if uu____7512
                 then ()
                 else
                   (let uu____7514 = lec_hd  in
                    match uu____7514 with
                    | (lb1,uu____7522,uu____7523) ->
                        let uu____7524 = lec2  in
                        (match uu____7524 with
                         | (lb2,uu____7532,uu____7533) ->
                             let msg =
                               let uu____7535 =
                                 FStar_Syntax_Print.lbname_to_string lb1  in
                               let uu____7536 =
                                 FStar_Syntax_Print.lbname_to_string lb2  in
                               FStar_Util.format2
                                 "Generalizing the types of these mutually recursive definitions requires an incompatible number of types for %s and %s"
                                 uu____7535 uu____7536
                                in
                             let uu____7537 =
                               FStar_TypeChecker_Env.get_range env  in
                             FStar_Errors.raise_error
                               (FStar_Errors.Fatal_IncompatibleNumberOfTypes,
                                 msg) uu____7537))
                  in
               let lecs1 =
                 let uu____7547 = FStar_List.tl lecs  in
                 FStar_List.fold_right
                   (fun this_lec  ->
                      fun lecs1  ->
                        let uu____7600 = univs_and_uvars_of_lec this_lec  in
                        match uu____7600 with
                        | (this_univs,this_uvs,this_lec1) ->
                            (force_univs_eq this_lec1 univs1 this_univs;
                             force_uvars_eq this_lec1 uvs this_uvs;
                             this_lec1
                             ::
                             lecs1)) uu____7547 []
                  in
               let lecs2 = lec_hd :: lecs1  in
               let gen_types uvs1 =
                 let fail1 k =
                   let uu____7701 = lec_hd  in
                   match uu____7701 with
                   | (lbname,e,c) ->
                       let uu____7711 =
                         let uu____7716 =
                           let uu____7717 =
                             FStar_Syntax_Print.term_to_string k  in
                           let uu____7718 =
                             FStar_Syntax_Print.lbname_to_string lbname  in
                           let uu____7719 =
                             FStar_Syntax_Print.term_to_string
                               (FStar_Syntax_Util.comp_result c)
                              in
                           FStar_Util.format3
                             "Failed to resolve implicit argument of type '%s' in the type of %s (%s)"
                             uu____7717 uu____7718 uu____7719
                            in
                         (FStar_Errors.Fatal_FailToResolveImplicitArgument,
                           uu____7716)
                          in
                       let uu____7720 = FStar_TypeChecker_Env.get_range env
                          in
                       FStar_Errors.raise_error uu____7711 uu____7720
                    in
                 FStar_All.pipe_right uvs1
                   (FStar_List.map
                      (fun u  ->
                         let uu____7741 =
                           FStar_Syntax_Unionfind.find
                             u.FStar_Syntax_Syntax.ctx_uvar_head
                            in
                         match uu____7741 with
                         | FStar_Pervasives_Native.Some uu____7750 ->
                             failwith
                               "Unexpected instantiation of mutually recursive uvar"
                         | uu____7757 ->
                             let k =
                               FStar_TypeChecker_Normalize.normalize
                                 [FStar_TypeChecker_Env.Beta;
                                 FStar_TypeChecker_Env.Exclude
                                   FStar_TypeChecker_Env.Zeta] env
                                 u.FStar_Syntax_Syntax.ctx_uvar_typ
                                in
                             let uu____7761 =
                               FStar_Syntax_Util.arrow_formals k  in
                             (match uu____7761 with
                              | (bs,kres) ->
                                  ((let uu____7805 =
                                      let uu____7806 =
                                        let uu____7809 =
                                          FStar_TypeChecker_Normalize.unfold_whnf
                                            env kres
                                           in
                                        FStar_Syntax_Util.unrefine uu____7809
                                         in
                                      uu____7806.FStar_Syntax_Syntax.n  in
                                    match uu____7805 with
                                    | FStar_Syntax_Syntax.Tm_type uu____7810
                                        ->
                                        let free =
                                          FStar_Syntax_Free.names kres  in
                                        let uu____7814 =
                                          let uu____7815 =
                                            FStar_Util.set_is_empty free  in
                                          Prims.op_Negation uu____7815  in
                                        if uu____7814 then fail1 kres else ()
                                    | uu____7817 -> fail1 kres);
                                   (let a =
                                      let uu____7819 =
                                        let uu____7822 =
                                          FStar_TypeChecker_Env.get_range env
                                           in
                                        FStar_All.pipe_left
                                          (fun _0_18  ->
                                             FStar_Pervasives_Native.Some
                                               _0_18) uu____7822
                                         in
                                      FStar_Syntax_Syntax.new_bv uu____7819
                                        kres
                                       in
                                    let t =
                                      match bs with
                                      | [] ->
                                          FStar_Syntax_Syntax.bv_to_name a
                                      | uu____7832 ->
                                          let uu____7841 =
                                            FStar_Syntax_Syntax.bv_to_name a
                                             in
                                          FStar_Syntax_Util.abs bs uu____7841
                                            (FStar_Pervasives_Native.Some
                                               (FStar_Syntax_Util.residual_tot
                                                  kres))
                                       in
                                    FStar_Syntax_Util.set_uvar
                                      u.FStar_Syntax_Syntax.ctx_uvar_head t;
                                    (a,
                                      (FStar_Pervasives_Native.Some
                                         FStar_Syntax_Syntax.imp_tag)))))))
                  in
               let gen_univs1 = gen_univs env univs1  in
               let gen_tvars = gen_types uvs  in
               let ecs =
                 FStar_All.pipe_right lecs2
                   (FStar_List.map
                      (fun uu____7948  ->
                         match uu____7948 with
                         | (lbname,e,c) ->
                             let uu____7996 =
                               match (gen_tvars, gen_univs1) with
                               | ([],[]) -> (e, c, [])
                               | uu____8071 ->
                                   let uu____8086 = (e, c)  in
                                   (match uu____8086 with
                                    | (e0,c0) ->
                                        let c1 =
                                          FStar_TypeChecker_Normalize.normalize_comp
                                            [FStar_TypeChecker_Env.Beta;
                                            FStar_TypeChecker_Env.DoNotUnfoldPureLets;
                                            FStar_TypeChecker_Env.CompressUvars;
                                            FStar_TypeChecker_Env.NoFullNorm;
                                            FStar_TypeChecker_Env.Exclude
                                              FStar_TypeChecker_Env.Zeta] env
                                            c
                                           in
                                        let e1 =
                                          FStar_TypeChecker_Normalize.reduce_uvar_solutions
                                            env e
                                           in
                                        let e2 =
                                          if is_rec
                                          then
                                            let tvar_args =
                                              FStar_List.map
                                                (fun uu____8129  ->
                                                   match uu____8129 with
                                                   | (x,uu____8137) ->
                                                       let uu____8142 =
                                                         FStar_Syntax_Syntax.bv_to_name
                                                           x
                                                          in
                                                       FStar_Syntax_Syntax.iarg
                                                         uu____8142)
                                                gen_tvars
                                               in
                                            let instantiate_lbname_with_app
                                              tm fv =
                                              let uu____8160 =
                                                let uu____8161 =
                                                  FStar_Util.right lbname  in
                                                FStar_Syntax_Syntax.fv_eq fv
                                                  uu____8161
                                                 in
                                              if uu____8160
                                              then
                                                FStar_Syntax_Syntax.mk_Tm_app
                                                  tm tvar_args
                                                  FStar_Pervasives_Native.None
                                                  tm.FStar_Syntax_Syntax.pos
                                              else tm  in
                                            FStar_Syntax_InstFV.inst
                                              instantiate_lbname_with_app e1
                                          else e1  in
                                        let t =
                                          let uu____8167 =
                                            let uu____8168 =
                                              FStar_Syntax_Subst.compress
                                                (FStar_Syntax_Util.comp_result
                                                   c1)
                                               in
                                            uu____8168.FStar_Syntax_Syntax.n
                                             in
                                          match uu____8167 with
                                          | FStar_Syntax_Syntax.Tm_arrow
                                              (bs,cod) ->
                                              let uu____8193 =
                                                FStar_Syntax_Subst.open_comp
                                                  bs cod
                                                 in
                                              (match uu____8193 with
                                               | (bs1,cod1) ->
                                                   FStar_Syntax_Util.arrow
                                                     (FStar_List.append
                                                        gen_tvars bs1) cod1)
                                          | uu____8206 ->
                                              FStar_Syntax_Util.arrow
                                                gen_tvars c1
                                           in
                                        let e' =
                                          FStar_Syntax_Util.abs gen_tvars e2
                                            (FStar_Pervasives_Native.Some
                                               (FStar_Syntax_Util.residual_comp_of_comp
                                                  c1))
                                           in
                                        let uu____8210 =
                                          FStar_Syntax_Syntax.mk_Total t  in
                                        (e', uu____8210, gen_tvars))
                                in
                             (match uu____7996 with
                              | (e1,c1,gvs) ->
                                  (lbname, gen_univs1, e1, c1, gvs))))
                  in
               FStar_Pervasives_Native.Some ecs)
  
let (generalize :
  FStar_TypeChecker_Env.env ->
    Prims.bool ->
      (FStar_Syntax_Syntax.lbname,FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.comp)
        FStar_Pervasives_Native.tuple3 Prims.list ->
        (FStar_Syntax_Syntax.lbname,FStar_Syntax_Syntax.univ_names,FStar_Syntax_Syntax.term,
          FStar_Syntax_Syntax.comp,FStar_Syntax_Syntax.binder Prims.list)
          FStar_Pervasives_Native.tuple5 Prims.list)
  =
  fun env  ->
    fun is_rec  ->
      fun lecs  ->
        (let uu____8364 = FStar_TypeChecker_Env.debug env FStar_Options.Low
            in
         if uu____8364
         then
           let uu____8365 =
             let uu____8366 =
               FStar_List.map
                 (fun uu____8379  ->
                    match uu____8379 with
                    | (lb,uu____8387,uu____8388) ->
                        FStar_Syntax_Print.lbname_to_string lb) lecs
                in
             FStar_All.pipe_right uu____8366 (FStar_String.concat ", ")  in
           FStar_Util.print1 "Generalizing: %s\n" uu____8365
         else ());
        (let univnames_lecs =
           FStar_List.map
             (fun uu____8409  ->
                match uu____8409 with
                | (l,t,c) -> gather_free_univnames env t) lecs
            in
         let generalized_lecs =
           let uu____8438 = gen env is_rec lecs  in
           match uu____8438 with
           | FStar_Pervasives_Native.None  ->
               FStar_All.pipe_right lecs
                 (FStar_List.map
                    (fun uu____8537  ->
                       match uu____8537 with | (l,t,c) -> (l, [], t, c, [])))
           | FStar_Pervasives_Native.Some luecs ->
               ((let uu____8599 =
                   FStar_TypeChecker_Env.debug env FStar_Options.Medium  in
                 if uu____8599
                 then
                   FStar_All.pipe_right luecs
                     (FStar_List.iter
                        (fun uu____8645  ->
                           match uu____8645 with
                           | (l,us,e,c,gvs) ->
                               let uu____8679 =
                                 FStar_Range.string_of_range
                                   e.FStar_Syntax_Syntax.pos
                                  in
                               let uu____8680 =
                                 FStar_Syntax_Print.lbname_to_string l  in
                               let uu____8681 =
                                 FStar_Syntax_Print.term_to_string
                                   (FStar_Syntax_Util.comp_result c)
                                  in
                               let uu____8682 =
                                 FStar_Syntax_Print.term_to_string e  in
                               let uu____8683 =
                                 FStar_Syntax_Print.binders_to_string ", "
                                   gvs
                                  in
                               FStar_Util.print5
                                 "(%s) Generalized %s at type %s\n%s\nVars = (%s)\n"
                                 uu____8679 uu____8680 uu____8681 uu____8682
                                 uu____8683))
                 else ());
                luecs)
            in
         FStar_List.map2
           (fun univnames1  ->
              fun uu____8724  ->
                match uu____8724 with
                | (l,generalized_univs,t,c,gvs) ->
                    let uu____8768 =
                      check_universe_generalization univnames1
                        generalized_univs t
                       in
                    (l, uu____8768, t, c, gvs)) univnames_lecs
           generalized_lecs)
  
let (check_and_ascribe :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term,FStar_TypeChecker_Env.guard_t)
            FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun e  ->
      fun t1  ->
        fun t2  ->
          let env1 =
            FStar_TypeChecker_Env.set_range env e.FStar_Syntax_Syntax.pos  in
          let check1 env2 t11 t21 =
            if env2.FStar_TypeChecker_Env.use_eq
            then FStar_TypeChecker_Rel.try_teq true env2 t11 t21
            else
              (let uu____8825 =
                 FStar_TypeChecker_Rel.get_subtyping_predicate env2 t11 t21
                  in
               match uu____8825 with
               | FStar_Pervasives_Native.None  ->
                   FStar_Pervasives_Native.None
               | FStar_Pervasives_Native.Some f ->
                   let uu____8831 = FStar_TypeChecker_Env.apply_guard f e  in
                   FStar_All.pipe_left
                     (fun _0_19  -> FStar_Pervasives_Native.Some _0_19)
                     uu____8831)
             in
          let is_var e1 =
            let uu____8840 =
              let uu____8841 = FStar_Syntax_Subst.compress e1  in
              uu____8841.FStar_Syntax_Syntax.n  in
            match uu____8840 with
            | FStar_Syntax_Syntax.Tm_name uu____8844 -> true
            | uu____8845 -> false  in
          let decorate e1 t =
            let e2 = FStar_Syntax_Subst.compress e1  in
            match e2.FStar_Syntax_Syntax.n with
            | FStar_Syntax_Syntax.Tm_name x ->
                FStar_Syntax_Syntax.mk
                  (FStar_Syntax_Syntax.Tm_name
                     (let uu___362_8865 = x  in
                      {
                        FStar_Syntax_Syntax.ppname =
                          (uu___362_8865.FStar_Syntax_Syntax.ppname);
                        FStar_Syntax_Syntax.index =
                          (uu___362_8865.FStar_Syntax_Syntax.index);
                        FStar_Syntax_Syntax.sort = t2
                      })) FStar_Pervasives_Native.None
                  e2.FStar_Syntax_Syntax.pos
            | uu____8866 -> e2  in
          let env2 =
            let uu___363_8868 = env1  in
            let uu____8869 =
              env1.FStar_TypeChecker_Env.use_eq ||
                (env1.FStar_TypeChecker_Env.is_pattern && (is_var e))
               in
            {
              FStar_TypeChecker_Env.solver =
                (uu___363_8868.FStar_TypeChecker_Env.solver);
              FStar_TypeChecker_Env.range =
                (uu___363_8868.FStar_TypeChecker_Env.range);
              FStar_TypeChecker_Env.curmodule =
                (uu___363_8868.FStar_TypeChecker_Env.curmodule);
              FStar_TypeChecker_Env.gamma =
                (uu___363_8868.FStar_TypeChecker_Env.gamma);
              FStar_TypeChecker_Env.gamma_sig =
                (uu___363_8868.FStar_TypeChecker_Env.gamma_sig);
              FStar_TypeChecker_Env.gamma_cache =
                (uu___363_8868.FStar_TypeChecker_Env.gamma_cache);
              FStar_TypeChecker_Env.modules =
                (uu___363_8868.FStar_TypeChecker_Env.modules);
              FStar_TypeChecker_Env.expected_typ =
                (uu___363_8868.FStar_TypeChecker_Env.expected_typ);
              FStar_TypeChecker_Env.sigtab =
                (uu___363_8868.FStar_TypeChecker_Env.sigtab);
              FStar_TypeChecker_Env.attrtab =
                (uu___363_8868.FStar_TypeChecker_Env.attrtab);
              FStar_TypeChecker_Env.is_pattern =
                (uu___363_8868.FStar_TypeChecker_Env.is_pattern);
              FStar_TypeChecker_Env.instantiate_imp =
                (uu___363_8868.FStar_TypeChecker_Env.instantiate_imp);
              FStar_TypeChecker_Env.effects =
                (uu___363_8868.FStar_TypeChecker_Env.effects);
              FStar_TypeChecker_Env.generalize =
                (uu___363_8868.FStar_TypeChecker_Env.generalize);
              FStar_TypeChecker_Env.letrecs =
                (uu___363_8868.FStar_TypeChecker_Env.letrecs);
              FStar_TypeChecker_Env.top_level =
                (uu___363_8868.FStar_TypeChecker_Env.top_level);
              FStar_TypeChecker_Env.check_uvars =
                (uu___363_8868.FStar_TypeChecker_Env.check_uvars);
              FStar_TypeChecker_Env.use_eq = uu____8869;
              FStar_TypeChecker_Env.is_iface =
                (uu___363_8868.FStar_TypeChecker_Env.is_iface);
              FStar_TypeChecker_Env.admit =
                (uu___363_8868.FStar_TypeChecker_Env.admit);
              FStar_TypeChecker_Env.lax =
                (uu___363_8868.FStar_TypeChecker_Env.lax);
              FStar_TypeChecker_Env.lax_universes =
                (uu___363_8868.FStar_TypeChecker_Env.lax_universes);
              FStar_TypeChecker_Env.phase1 =
                (uu___363_8868.FStar_TypeChecker_Env.phase1);
              FStar_TypeChecker_Env.failhard =
                (uu___363_8868.FStar_TypeChecker_Env.failhard);
              FStar_TypeChecker_Env.nosynth =
                (uu___363_8868.FStar_TypeChecker_Env.nosynth);
              FStar_TypeChecker_Env.uvar_subtyping =
                (uu___363_8868.FStar_TypeChecker_Env.uvar_subtyping);
              FStar_TypeChecker_Env.tc_term =
                (uu___363_8868.FStar_TypeChecker_Env.tc_term);
              FStar_TypeChecker_Env.type_of =
                (uu___363_8868.FStar_TypeChecker_Env.type_of);
              FStar_TypeChecker_Env.universe_of =
                (uu___363_8868.FStar_TypeChecker_Env.universe_of);
              FStar_TypeChecker_Env.check_type_of =
                (uu___363_8868.FStar_TypeChecker_Env.check_type_of);
              FStar_TypeChecker_Env.use_bv_sorts =
                (uu___363_8868.FStar_TypeChecker_Env.use_bv_sorts);
              FStar_TypeChecker_Env.qtbl_name_and_index =
                (uu___363_8868.FStar_TypeChecker_Env.qtbl_name_and_index);
              FStar_TypeChecker_Env.normalized_eff_names =
                (uu___363_8868.FStar_TypeChecker_Env.normalized_eff_names);
              FStar_TypeChecker_Env.proof_ns =
                (uu___363_8868.FStar_TypeChecker_Env.proof_ns);
              FStar_TypeChecker_Env.synth_hook =
                (uu___363_8868.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.splice =
                (uu___363_8868.FStar_TypeChecker_Env.splice);
              FStar_TypeChecker_Env.is_native_tactic =
                (uu___363_8868.FStar_TypeChecker_Env.is_native_tactic);
              FStar_TypeChecker_Env.identifier_info =
                (uu___363_8868.FStar_TypeChecker_Env.identifier_info);
              FStar_TypeChecker_Env.tc_hooks =
                (uu___363_8868.FStar_TypeChecker_Env.tc_hooks);
              FStar_TypeChecker_Env.dsenv =
                (uu___363_8868.FStar_TypeChecker_Env.dsenv);
              FStar_TypeChecker_Env.nbe =
                (uu___363_8868.FStar_TypeChecker_Env.nbe)
            }  in
          let uu____8870 = check1 env2 t1 t2  in
          match uu____8870 with
          | FStar_Pervasives_Native.None  ->
              let uu____8877 =
                FStar_TypeChecker_Err.expected_expression_of_type env2 t2 e
                  t1
                 in
              let uu____8882 = FStar_TypeChecker_Env.get_range env2  in
              FStar_Errors.raise_error uu____8877 uu____8882
          | FStar_Pervasives_Native.Some g ->
              ((let uu____8889 =
                  FStar_All.pipe_left (FStar_TypeChecker_Env.debug env2)
                    (FStar_Options.Other "Rel")
                   in
                if uu____8889
                then
                  let uu____8890 =
                    FStar_TypeChecker_Rel.guard_to_string env2 g  in
                  FStar_All.pipe_left
                    (FStar_Util.print1 "Applied guard is %s\n") uu____8890
                else ());
               (let uu____8892 = decorate e t2  in (uu____8892, g)))
  
let (check_top_level :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Env.guard_t ->
      FStar_Syntax_Syntax.lcomp ->
        (Prims.bool,FStar_Syntax_Syntax.comp) FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun g  ->
      fun lc  ->
        (let uu____8917 = FStar_TypeChecker_Env.debug env FStar_Options.Low
            in
         if uu____8917
         then
           let uu____8918 = FStar_Syntax_Print.lcomp_to_string lc  in
           FStar_Util.print1 "check_top_level, lc = %s\n" uu____8918
         else ());
        (let discharge g1 =
           FStar_TypeChecker_Rel.force_trivial_guard env g1;
           FStar_Syntax_Util.is_pure_lcomp lc  in
         let g1 = FStar_TypeChecker_Rel.solve_deferred_constraints env g  in
         let uu____8928 = FStar_Syntax_Util.is_total_lcomp lc  in
         if uu____8928
         then
           let uu____8933 = discharge g1  in
           let uu____8934 = FStar_Syntax_Syntax.lcomp_comp lc  in
           (uu____8933, uu____8934)
         else
           (let c = FStar_Syntax_Syntax.lcomp_comp lc  in
            let steps =
              [FStar_TypeChecker_Env.Beta;
              FStar_TypeChecker_Env.NoFullNorm;
              FStar_TypeChecker_Env.DoNotUnfoldPureLets]  in
            let c1 =
              let uu____8941 =
                let uu____8942 =
                  let uu____8943 =
                    FStar_TypeChecker_Env.unfold_effect_abbrev env c  in
                  FStar_All.pipe_right uu____8943 FStar_Syntax_Syntax.mk_Comp
                   in
                FStar_All.pipe_right uu____8942
                  (FStar_TypeChecker_Normalize.normalize_comp steps env)
                 in
              FStar_All.pipe_right uu____8941
                (FStar_TypeChecker_Env.comp_to_comp_typ env)
               in
            let md =
              FStar_TypeChecker_Env.get_effect_decl env
                c1.FStar_Syntax_Syntax.effect_name
               in
            let uu____8945 = destruct_comp c1  in
            match uu____8945 with
            | (u_t,t,wp) ->
                let vc =
                  let uu____8962 = FStar_TypeChecker_Env.get_range env  in
                  let uu____8963 =
                    let uu____8968 =
                      FStar_TypeChecker_Env.inst_effect_fun_with [u_t] env md
                        md.FStar_Syntax_Syntax.trivial
                       in
                    let uu____8969 =
                      let uu____8970 = FStar_Syntax_Syntax.as_arg t  in
                      let uu____8979 =
                        let uu____8990 = FStar_Syntax_Syntax.as_arg wp  in
                        [uu____8990]  in
                      uu____8970 :: uu____8979  in
                    FStar_Syntax_Syntax.mk_Tm_app uu____8968 uu____8969  in
                  uu____8963 FStar_Pervasives_Native.None uu____8962  in
                ((let uu____9026 =
                    FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                      (FStar_Options.Other "Simplification")
                     in
                  if uu____9026
                  then
                    let uu____9027 = FStar_Syntax_Print.term_to_string vc  in
                    FStar_Util.print1 "top-level VC: %s\n" uu____9027
                  else ());
                 (let g2 =
                    let uu____9030 =
                      FStar_All.pipe_left
                        FStar_TypeChecker_Env.guard_of_guard_formula
                        (FStar_TypeChecker_Common.NonTrivial vc)
                       in
                    FStar_TypeChecker_Env.conj_guard g1 uu____9030  in
                  let uu____9031 = discharge g2  in
                  let uu____9032 = FStar_Syntax_Syntax.mk_Comp c1  in
                  (uu____9031, uu____9032)))))
  
let (short_circuit :
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.args -> FStar_TypeChecker_Common.guard_formula)
  =
  fun head1  ->
    fun seen_args  ->
      let short_bin_op f uu___339_9064 =
        match uu___339_9064 with
        | [] -> FStar_TypeChecker_Common.Trivial
        | (fst1,uu____9074)::[] -> f fst1
        | uu____9099 -> failwith "Unexpexted args to binary operator"  in
      let op_and_e e =
        let uu____9110 = FStar_Syntax_Util.b2t e  in
        FStar_All.pipe_right uu____9110
          (fun _0_20  -> FStar_TypeChecker_Common.NonTrivial _0_20)
         in
      let op_or_e e =
        let uu____9121 =
          let uu____9122 = FStar_Syntax_Util.b2t e  in
          FStar_Syntax_Util.mk_neg uu____9122  in
        FStar_All.pipe_right uu____9121
          (fun _0_21  -> FStar_TypeChecker_Common.NonTrivial _0_21)
         in
      let op_and_t t =
        FStar_All.pipe_right t
          (fun _0_22  -> FStar_TypeChecker_Common.NonTrivial _0_22)
         in
      let op_or_t t =
        let uu____9141 = FStar_All.pipe_right t FStar_Syntax_Util.mk_neg  in
        FStar_All.pipe_right uu____9141
          (fun _0_23  -> FStar_TypeChecker_Common.NonTrivial _0_23)
         in
      let op_imp_t t =
        FStar_All.pipe_right t
          (fun _0_24  -> FStar_TypeChecker_Common.NonTrivial _0_24)
         in
      let short_op_ite uu___340_9155 =
        match uu___340_9155 with
        | [] -> FStar_TypeChecker_Common.Trivial
        | (guard,uu____9165)::[] -> FStar_TypeChecker_Common.NonTrivial guard
        | _then::(guard,uu____9192)::[] ->
            let uu____9233 = FStar_Syntax_Util.mk_neg guard  in
            FStar_All.pipe_right uu____9233
              (fun _0_25  -> FStar_TypeChecker_Common.NonTrivial _0_25)
        | uu____9234 -> failwith "Unexpected args to ITE"  in
      let table =
        let uu____9245 =
          let uu____9253 = short_bin_op op_and_e  in
          (FStar_Parser_Const.op_And, uu____9253)  in
        let uu____9261 =
          let uu____9271 =
            let uu____9279 = short_bin_op op_or_e  in
            (FStar_Parser_Const.op_Or, uu____9279)  in
          let uu____9287 =
            let uu____9297 =
              let uu____9305 = short_bin_op op_and_t  in
              (FStar_Parser_Const.and_lid, uu____9305)  in
            let uu____9313 =
              let uu____9323 =
                let uu____9331 = short_bin_op op_or_t  in
                (FStar_Parser_Const.or_lid, uu____9331)  in
              let uu____9339 =
                let uu____9349 =
                  let uu____9357 = short_bin_op op_imp_t  in
                  (FStar_Parser_Const.imp_lid, uu____9357)  in
                [uu____9349; (FStar_Parser_Const.ite_lid, short_op_ite)]  in
              uu____9323 :: uu____9339  in
            uu____9297 :: uu____9313  in
          uu____9271 :: uu____9287  in
        uu____9245 :: uu____9261  in
      match head1.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          let lid = (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          let uu____9419 =
            FStar_Util.find_map table
              (fun uu____9434  ->
                 match uu____9434 with
                 | (x,mk1) ->
                     let uu____9451 = FStar_Ident.lid_equals x lid  in
                     if uu____9451
                     then
                       let uu____9454 = mk1 seen_args  in
                       FStar_Pervasives_Native.Some uu____9454
                     else FStar_Pervasives_Native.None)
             in
          (match uu____9419 with
           | FStar_Pervasives_Native.None  ->
               FStar_TypeChecker_Common.Trivial
           | FStar_Pervasives_Native.Some g -> g)
      | uu____9457 -> FStar_TypeChecker_Common.Trivial
  
let (short_circuit_head : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun l  ->
    let uu____9463 =
      let uu____9464 = FStar_Syntax_Util.un_uinst l  in
      uu____9464.FStar_Syntax_Syntax.n  in
    match uu____9463 with
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        FStar_Util.for_some (FStar_Syntax_Syntax.fv_eq_lid fv)
          [FStar_Parser_Const.op_And;
          FStar_Parser_Const.op_Or;
          FStar_Parser_Const.and_lid;
          FStar_Parser_Const.or_lid;
          FStar_Parser_Const.imp_lid;
          FStar_Parser_Const.ite_lid]
    | uu____9468 -> false
  
let (maybe_add_implicit_binders :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binders -> FStar_Syntax_Syntax.binders)
  =
  fun env  ->
    fun bs  ->
      let pos bs1 =
        match bs1 with
        | (hd1,uu____9502)::uu____9503 -> FStar_Syntax_Syntax.range_of_bv hd1
        | uu____9522 -> FStar_TypeChecker_Env.get_range env  in
      match bs with
      | (uu____9531,FStar_Pervasives_Native.Some
         (FStar_Syntax_Syntax.Implicit uu____9532))::uu____9533 -> bs
      | uu____9550 ->
          let uu____9551 = FStar_TypeChecker_Env.expected_typ env  in
          (match uu____9551 with
           | FStar_Pervasives_Native.None  -> bs
           | FStar_Pervasives_Native.Some t ->
               let uu____9555 =
                 let uu____9556 = FStar_Syntax_Subst.compress t  in
                 uu____9556.FStar_Syntax_Syntax.n  in
               (match uu____9555 with
                | FStar_Syntax_Syntax.Tm_arrow (bs',uu____9560) ->
                    let uu____9581 =
                      FStar_Util.prefix_until
                        (fun uu___341_9621  ->
                           match uu___341_9621 with
                           | (uu____9628,FStar_Pervasives_Native.Some
                              (FStar_Syntax_Syntax.Implicit uu____9629)) ->
                               false
                           | uu____9632 -> true) bs'
                       in
                    (match uu____9581 with
                     | FStar_Pervasives_Native.None  -> bs
                     | FStar_Pervasives_Native.Some
                         ([],uu____9667,uu____9668) -> bs
                     | FStar_Pervasives_Native.Some
                         (imps,uu____9740,uu____9741) ->
                         let uu____9814 =
                           FStar_All.pipe_right imps
                             (FStar_Util.for_all
                                (fun uu____9832  ->
                                   match uu____9832 with
                                   | (x,uu____9840) ->
                                       FStar_Util.starts_with
                                         (x.FStar_Syntax_Syntax.ppname).FStar_Ident.idText
                                         "'"))
                            in
                         if uu____9814
                         then
                           let r = pos bs  in
                           let imps1 =
                             FStar_All.pipe_right imps
                               (FStar_List.map
                                  (fun uu____9887  ->
                                     match uu____9887 with
                                     | (x,i) ->
                                         let uu____9906 =
                                           FStar_Syntax_Syntax.set_range_of_bv
                                             x r
                                            in
                                         (uu____9906, i)))
                              in
                           FStar_List.append imps1 bs
                         else bs)
                | uu____9916 -> bs))
  
let (maybe_lift :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Ident.lident ->
        FStar_Ident.lident ->
          FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun e  ->
      fun c1  ->
        fun c2  ->
          fun t  ->
            let m1 = FStar_TypeChecker_Env.norm_eff_name env c1  in
            let m2 = FStar_TypeChecker_Env.norm_eff_name env c2  in
            let uu____9944 =
              ((FStar_Ident.lid_equals m1 m2) ||
                 ((FStar_Syntax_Util.is_pure_effect c1) &&
                    (FStar_Syntax_Util.is_ghost_effect c2)))
                ||
                ((FStar_Syntax_Util.is_pure_effect c2) &&
                   (FStar_Syntax_Util.is_ghost_effect c1))
               in
            if uu____9944
            then e
            else
              FStar_Syntax_Syntax.mk
                (FStar_Syntax_Syntax.Tm_meta
                   (e, (FStar_Syntax_Syntax.Meta_monadic_lift (m1, m2, t))))
                FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos
  
let (maybe_monadic :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Ident.lident ->
        FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun e  ->
      fun c  ->
        fun t  ->
          let m = FStar_TypeChecker_Env.norm_eff_name env c  in
          let uu____9971 =
            ((is_pure_or_ghost_effect env m) ||
               (FStar_Ident.lid_equals m FStar_Parser_Const.effect_Tot_lid))
              ||
              (FStar_Ident.lid_equals m FStar_Parser_Const.effect_GTot_lid)
             in
          if uu____9971
          then e
          else
            FStar_Syntax_Syntax.mk
              (FStar_Syntax_Syntax.Tm_meta
                 (e, (FStar_Syntax_Syntax.Meta_monadic (m, t))))
              FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos
  
let (d : Prims.string -> unit) =
  fun s  -> FStar_Util.print1 "\027[01;36m%s\027[00m\n" s 
let (mk_toplevel_definition :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.term ->
        (FStar_Syntax_Syntax.sigelt,FStar_Syntax_Syntax.term)
          FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun lident  ->
      fun def  ->
        (let uu____10006 =
           FStar_TypeChecker_Env.debug env (FStar_Options.Other "ED")  in
         if uu____10006
         then
           ((let uu____10008 = FStar_Ident.text_of_lid lident  in
             d uu____10008);
            (let uu____10009 = FStar_Ident.text_of_lid lident  in
             let uu____10010 = FStar_Syntax_Print.term_to_string def  in
             FStar_Util.print2 "Registering top-level definition: %s\n%s\n"
               uu____10009 uu____10010))
         else ());
        (let fv =
           let uu____10013 = FStar_Syntax_Util.incr_delta_qualifier def  in
           FStar_Syntax_Syntax.lid_as_fv lident uu____10013
             FStar_Pervasives_Native.None
            in
         let lbname = FStar_Util.Inr fv  in
         let lb =
           (false,
             [FStar_Syntax_Util.mk_letbinding lbname []
                FStar_Syntax_Syntax.tun FStar_Parser_Const.effect_Tot_lid def
                [] FStar_Range.dummyRange])
            in
         let sig_ctx =
           FStar_Syntax_Syntax.mk_sigelt
             (FStar_Syntax_Syntax.Sig_let (lb, [lident]))
            in
         let uu____10023 =
           FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_fvar fv)
             FStar_Pervasives_Native.None FStar_Range.dummyRange
            in
         ((let uu___364_10025 = sig_ctx  in
           {
             FStar_Syntax_Syntax.sigel =
               (uu___364_10025.FStar_Syntax_Syntax.sigel);
             FStar_Syntax_Syntax.sigrng =
               (uu___364_10025.FStar_Syntax_Syntax.sigrng);
             FStar_Syntax_Syntax.sigquals =
               [FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen];
             FStar_Syntax_Syntax.sigmeta =
               (uu___364_10025.FStar_Syntax_Syntax.sigmeta);
             FStar_Syntax_Syntax.sigattrs =
               (uu___364_10025.FStar_Syntax_Syntax.sigattrs)
           }), uu____10023))
  
let (check_sigelt_quals :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.sigelt -> unit) =
  fun env  ->
    fun se  ->
      let visibility uu___342_10041 =
        match uu___342_10041 with
        | FStar_Syntax_Syntax.Private  -> true
        | uu____10042 -> false  in
      let reducibility uu___343_10048 =
        match uu___343_10048 with
        | FStar_Syntax_Syntax.Abstract  -> true
        | FStar_Syntax_Syntax.Irreducible  -> true
        | FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen  -> true
        | FStar_Syntax_Syntax.Visible_default  -> true
        | FStar_Syntax_Syntax.Inline_for_extraction  -> true
        | uu____10049 -> false  in
      let assumption uu___344_10055 =
        match uu___344_10055 with
        | FStar_Syntax_Syntax.Assumption  -> true
        | FStar_Syntax_Syntax.New  -> true
        | uu____10056 -> false  in
      let reification uu___345_10062 =
        match uu___345_10062 with
        | FStar_Syntax_Syntax.Reifiable  -> true
        | FStar_Syntax_Syntax.Reflectable uu____10063 -> true
        | uu____10064 -> false  in
      let inferred uu___346_10070 =
        match uu___346_10070 with
        | FStar_Syntax_Syntax.Discriminator uu____10071 -> true
        | FStar_Syntax_Syntax.Projector uu____10072 -> true
        | FStar_Syntax_Syntax.RecordType uu____10077 -> true
        | FStar_Syntax_Syntax.RecordConstructor uu____10086 -> true
        | FStar_Syntax_Syntax.ExceptionConstructor  -> true
        | FStar_Syntax_Syntax.HasMaskedEffect  -> true
        | FStar_Syntax_Syntax.Effect  -> true
        | uu____10095 -> false  in
      let has_eq uu___347_10101 =
        match uu___347_10101 with
        | FStar_Syntax_Syntax.Noeq  -> true
        | FStar_Syntax_Syntax.Unopteq  -> true
        | uu____10102 -> false  in
      let quals_combo_ok quals q =
        match q with
        | FStar_Syntax_Syntax.Assumption  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                          (inferred x))
                         || (visibility x))
                        || (assumption x))
                       ||
                       (env.FStar_TypeChecker_Env.is_iface &&
                          (x = FStar_Syntax_Syntax.Inline_for_extraction)))
                      || (x = FStar_Syntax_Syntax.NoExtract)))
        | FStar_Syntax_Syntax.New  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    (((x = q) || (inferred x)) || (visibility x)) ||
                      (assumption x)))
        | FStar_Syntax_Syntax.Inline_for_extraction  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    (((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                           (visibility x))
                          || (reducibility x))
                         || (reification x))
                        || (inferred x))
                       ||
                       (env.FStar_TypeChecker_Env.is_iface &&
                          (x = FStar_Syntax_Syntax.Assumption)))
                      || (x = FStar_Syntax_Syntax.NoExtract)))
        | FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Visible_default  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Irreducible  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Abstract  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Noeq  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Unopteq  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.TotalEffect  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    (((x = q) || (inferred x)) || (visibility x)) ||
                      (reification x)))
        | FStar_Syntax_Syntax.Logic  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((x = q) || (x = FStar_Syntax_Syntax.Assumption)) ||
                        (inferred x))
                       || (visibility x))
                      || (reducibility x)))
        | FStar_Syntax_Syntax.Reifiable  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((reification x) || (inferred x)) || (visibility x)) ||
                       (x = FStar_Syntax_Syntax.TotalEffect))
                      || (x = FStar_Syntax_Syntax.Visible_default)))
        | FStar_Syntax_Syntax.Reflectable uu____10166 ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((reification x) || (inferred x)) || (visibility x)) ||
                       (x = FStar_Syntax_Syntax.TotalEffect))
                      || (x = FStar_Syntax_Syntax.Visible_default)))
        | FStar_Syntax_Syntax.Private  -> true
        | uu____10171 -> true  in
      let quals =
        FStar_All.pipe_right (FStar_Syntax_Util.quals_of_sigelt se)
          (FStar_List.filter
             (fun x  -> Prims.op_Negation (x = FStar_Syntax_Syntax.Logic)))
         in
      let uu____10181 =
        let uu____10182 =
          FStar_All.pipe_right quals
            (FStar_Util.for_some
               (fun uu___348_10186  ->
                  match uu___348_10186 with
                  | FStar_Syntax_Syntax.OnlyName  -> true
                  | uu____10187 -> false))
           in
        FStar_All.pipe_right uu____10182 Prims.op_Negation  in
      if uu____10181
      then
        let r = FStar_Syntax_Util.range_of_sigelt se  in
        let no_dup_quals =
          FStar_Util.remove_dups (fun x  -> fun y  -> x = y) quals  in
        let err' msg =
          let uu____10202 =
            let uu____10207 =
              let uu____10208 = FStar_Syntax_Print.quals_to_string quals  in
              FStar_Util.format2
                "The qualifier list \"[%s]\" is not permissible for this element%s"
                uu____10208 msg
               in
            (FStar_Errors.Fatal_QulifierListNotPermitted, uu____10207)  in
          FStar_Errors.raise_error uu____10202 r  in
        let err msg = err' (Prims.strcat ": " msg)  in
        let err'1 uu____10220 = err' ""  in
        (if (FStar_List.length quals) <> (FStar_List.length no_dup_quals)
         then err "duplicate qualifiers"
         else ();
         (let uu____10224 =
            let uu____10225 =
              FStar_All.pipe_right quals
                (FStar_List.for_all (quals_combo_ok quals))
               in
            Prims.op_Negation uu____10225  in
          if uu____10224 then err "ill-formed combination" else ());
         (match se.FStar_Syntax_Syntax.sigel with
          | FStar_Syntax_Syntax.Sig_let ((is_rec,uu____10230),uu____10231) ->
              ((let uu____10241 =
                  is_rec &&
                    (FStar_All.pipe_right quals
                       (FStar_List.contains
                          FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen))
                   in
                if uu____10241
                then err "recursive definitions cannot be marked inline"
                else ());
               (let uu____10245 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_some
                       (fun x  -> (assumption x) || (has_eq x)))
                   in
                if uu____10245
                then
                  err
                    "definitions cannot be assumed or marked with equality qualifiers"
                else ()))
          | FStar_Syntax_Syntax.Sig_bundle uu____10251 ->
              let uu____10260 =
                let uu____10261 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  ->
                          ((((x = FStar_Syntax_Syntax.Abstract) ||
                               (x = FStar_Syntax_Syntax.NoExtract))
                              || (inferred x))
                             || (visibility x))
                            || (has_eq x)))
                   in
                Prims.op_Negation uu____10261  in
              if uu____10260 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_declare_typ uu____10267 ->
              let uu____10274 =
                FStar_All.pipe_right quals (FStar_Util.for_some has_eq)  in
              if uu____10274 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_assume uu____10278 ->
              let uu____10285 =
                let uu____10286 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  ->
                          (visibility x) ||
                            (x = FStar_Syntax_Syntax.Assumption)))
                   in
                Prims.op_Negation uu____10286  in
              if uu____10285 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_new_effect uu____10292 ->
              let uu____10293 =
                let uu____10294 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  ->
                          (((x = FStar_Syntax_Syntax.TotalEffect) ||
                              (inferred x))
                             || (visibility x))
                            || (reification x)))
                   in
                Prims.op_Negation uu____10294  in
              if uu____10293 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____10300 ->
              let uu____10301 =
                let uu____10302 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  ->
                          (((x = FStar_Syntax_Syntax.TotalEffect) ||
                              (inferred x))
                             || (visibility x))
                            || (reification x)))
                   in
                Prims.op_Negation uu____10302  in
              if uu____10301 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_effect_abbrev uu____10308 ->
              let uu____10321 =
                let uu____10322 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  -> (inferred x) || (visibility x)))
                   in
                Prims.op_Negation uu____10322  in
              if uu____10321 then err'1 () else ()
          | uu____10328 -> ()))
      else ()
  
let (must_erase_for_extraction :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun g  ->
    fun t  ->
      let rec aux_whnf env t1 =
        let uu____10362 =
          let uu____10363 = FStar_Syntax_Subst.compress t1  in
          uu____10363.FStar_Syntax_Syntax.n  in
        match uu____10362 with
        | FStar_Syntax_Syntax.Tm_type uu____10366 -> true
        | FStar_Syntax_Syntax.Tm_fvar fv ->
            (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.unit_lid) ||
              (let uu____10369 =
                 let uu____10374 =
                   FStar_All.pipe_right fv FStar_Syntax_Syntax.lid_of_fv  in
                 FStar_All.pipe_right uu____10374
                   (FStar_TypeChecker_Env.lookup_attrs_of_lid g)
                  in
               FStar_All.pipe_right uu____10369
                 (fun l_opt  ->
                    (FStar_Util.is_some l_opt) &&
                      (let uu____10392 =
                         FStar_All.pipe_right l_opt FStar_Util.must  in
                       FStar_All.pipe_right uu____10392
                         (FStar_List.existsb
                            (fun t2  ->
                               let uu____10409 =
                                 let uu____10410 =
                                   FStar_Syntax_Subst.compress t2  in
                                 uu____10410.FStar_Syntax_Syntax.n  in
                               match uu____10409 with
                               | FStar_Syntax_Syntax.Tm_fvar fv1 when
                                   FStar_Ident.lid_equals
                                     (fv1.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                                     FStar_Parser_Const.must_erase_for_extraction_attr
                                   -> true
                               | uu____10414 -> false)))))
        | FStar_Syntax_Syntax.Tm_arrow uu____10415 ->
            let uu____10430 = FStar_Syntax_Util.arrow_formals_comp t1  in
            (match uu____10430 with
             | (bs,c) ->
                 let env1 = FStar_TypeChecker_Env.push_binders env bs  in
                 let uu____10462 = FStar_Syntax_Util.is_pure_comp c  in
                 if uu____10462
                 then aux env1 (FStar_Syntax_Util.comp_result c)
                 else FStar_Syntax_Util.is_pure_or_ghost_comp c)
        | FStar_Syntax_Syntax.Tm_refine
            ({ FStar_Syntax_Syntax.ppname = uu____10464;
               FStar_Syntax_Syntax.index = uu____10465;
               FStar_Syntax_Syntax.sort = t2;_},uu____10467)
            -> aux env t2
        | FStar_Syntax_Syntax.Tm_ascribed (t2,uu____10475,uu____10476) ->
            aux env t2
        | FStar_Syntax_Syntax.Tm_app (head1,uu____10518::[]) ->
            let uu____10557 =
              let uu____10558 = FStar_Syntax_Util.un_uinst head1  in
              uu____10558.FStar_Syntax_Syntax.n  in
            (match uu____10557 with
             | FStar_Syntax_Syntax.Tm_fvar fv ->
                 FStar_Syntax_Syntax.fv_eq_lid fv
                   FStar_Parser_Const.erased_lid
             | uu____10562 -> false)
        | uu____10563 -> false
      
      and aux env t1 =
        let t2 =
          FStar_TypeChecker_Normalize.normalize
            [FStar_TypeChecker_Env.Primops;
            FStar_TypeChecker_Env.Weak;
            FStar_TypeChecker_Env.HNF;
            FStar_TypeChecker_Env.UnfoldUntil
              FStar_Syntax_Syntax.delta_constant;
            FStar_TypeChecker_Env.Beta;
            FStar_TypeChecker_Env.AllowUnboundUniverses;
            FStar_TypeChecker_Env.Zeta;
            FStar_TypeChecker_Env.Iota] env t1
           in
        let res = aux_whnf env t2  in
        (let uu____10571 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Extraction")
            in
         if uu____10571
         then
           let uu____10572 = FStar_Syntax_Print.term_to_string t2  in
           FStar_Util.print2 "must_erase=%s: %s\n"
             (if res then "true" else "false") uu____10572
         else ());
        res
       in aux g t
  