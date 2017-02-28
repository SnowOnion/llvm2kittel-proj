//
// Created by lee on 17-2-28.
//

#include <list>
#include "llvm2kittel/IntTRS/Rule.h"
#include <llvm2kittel/IntTRS/Term.h>
#include <llvm2kittel/IntTRS/Constraint.h>
#include <llvm2kittel/IntTRS/Polynomial.h>

using std::list;


int main() {
    // 插入自己构造的 kittelized rule!
    list<ref<Rule> > myKittelizedRules({Rule::create(
            Term::create("eval_main_start", list<ref<Polynomial> >(
                    {Polynomial::create("v_y.0"),
                     Polynomial::create("v_r.0"),
                     Polynomial::create("v_1")})),
            Term::create("eval_main_bb0_in", list<ref<Polynomial> >(
                    {Polynomial::create("v_y.0"),
                     Polynomial::create("v_r.0"),
                     Polynomial::create("v_1")})),
            True::create()), Rule::create(
            Term::create("eval_main_bb0_in", list<ref<Polynomial> >(
                    {Polynomial::create("v_y.0"), Polynomial::create("v_r.0"), Polynomial::create("v_1")})),
            Term::create("eval_main_bb1_in", list<ref<Polynomial> >(
                    {Polynomial::create("nondef.0"), Polynomial::create("1"), Polynomial::create("v_1")})),
            True::create()), Rule::create(
            Term::create("eval_main_bb1_in", list<ref<Polynomial> >(
                    {Polynomial::create("v_y.0"), Polynomial::create("v_r.0"), Polynomial::create("v_1")})),
            Term::create("eval_main_bb1_in", list<ref<Polynomial> >(
                    {Polynomial::create("v_y.0")->sub(Polynomial::one), Polynomial::create("0"),
                     Polynomial::create("v_y.0")->sub(Polynomial::one)})),
            Atom::create(Polynomial::create("v_y.0"), Polynomial::null, Atom::AType::Gtr)), Rule::create(
            Term::create("eval_main_bb1_in", list<ref<Polynomial> >(
                    {Polynomial::create("v_y.0"), Polynomial::create("v_r.0"), Polynomial::create("v_1")})),
            Term::create("eval_main_bb2_in", list<ref<Polynomial> >(
                    {Polynomial::create("v_y.0"), Polynomial::create("v_r.0"),
                     Polynomial::create("v_y.0")->sub(Polynomial::one)})),
            Atom::create(Polynomial::create("v_y.0"), Polynomial::null, Atom::AType::Leq)), Rule::create(
            Term::create("eval_main_bb2_in", list<ref<Polynomial> >(
                    {Polynomial::create("v_y.0"), Polynomial::create("v_r.0"), Polynomial::create("v_1")})),
            Term::create("eval_main_stop", list<ref<Polynomial> >(
                    {Polynomial::create("v_y.0"), Polynomial::create("v_r.0"), Polynomial::create("v_1")})),
            True::create())
                                       });
}