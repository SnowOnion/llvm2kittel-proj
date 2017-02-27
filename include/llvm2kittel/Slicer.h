// This file is part of llvm2KITTeL
//
// Copyright 2010-2014 Stephan Falke
//
// Licensed under the University of Illinois/NCSA Open Source License.
// See LICENSE for details.

#ifndef SLICER_H
#define SLICER_H

#include "llvm2kittel/Util/Ref.h"
#include "llvm2kittel/Util/Version.h"

// llvm includes
#include "WARN_OFF.h"
#if LLVM_VERSION < VERSION(3, 3)
  #include <llvm/Function.h>
#else
  #include <llvm/IR/Function.h>
#endif
#include "WARN_ON.h"

// C++ includes
#include <list>
#include <map>
#include <set>

class Rule;

class Slicer
{

public:
    Slicer(llvm::Function *F, std::set<std::string> phiVars);
    ~Slicer();

    static std::list<ref<Rule> > sliceUsage(std::list<ref<Rule> > rules);

    static std::list<ref<Rule> > sliceConstraint(std::list<ref<Rule> > rules);

    static std::list<ref<Rule> > sliceDefined(std::list<ref<Rule> > rules);

    static std::list<ref<Rule> > sliceStillUsed(std::list<ref<Rule> > rules, bool conservative);

    static std::list<ref<Rule> > sliceTrivialNondefConstraints(std::list<ref<Rule> > rules);

    static std::list<ref<Rule> > sliceDuplicates(std::list<ref<Rule> > rules);

    static std::list<ref<Rule> > sliceUsagePure(std::list<ref<Rule> > rules);

    static std::list<ref<Rule> > sliceConstraintPure(std::list<ref<Rule> > rules);

    static std::list<ref<Rule> > sliceDefinedPure(std::list<ref<Rule> > rules);

    static std::list<ref<Rule> > sliceStillUsedPure(std::list<ref<Rule> > rules);

    static std::list<ref<Rule> > sliceTrivialNondefConstraintsPure(std::list<ref<Rule> > rules);

    static std::list<ref<Rule> > sliceDuplicatesPure(std::list<ref<Rule> > rules);

//private:
public:
    llvm::Function *m_F;

    static std::set<unsigned int> getSet(unsigned int size);

    std::string getVar(std::string name);
    static std::string getEval(std::string startstop);

//    const static std::map<std::string, unsigned int> m_functionIdx=std::map<std::string, unsigned int>();
//    const static std::map<unsigned int, std::string> m_idxFunction=std::map<unsigned int, std::string>();
    static unsigned int getIdxFunction(std::string f,std::map<std::string, unsigned int> m_functionIdx);
    static std::string getFunction(unsigned int idx,std::map<unsigned int, std::string>& m_idxFunction);

//    static unsigned int m_numFunctions;

    // 在 setUpCalls 和 setUpPreceeds 里用到，但每次都当场计算！！
//    static std::set<std::string> m_functions;


//    static bool *m_preceeds;
    static void setUpPreceeds(std::list<ref<Rule> > rules);
    static void makePreceedsTransitive(unsigned int m_numFunctions,bool* m_preceeds);
//    static bool *m_calls;
    static void setUpCalls(std::list<ref<Rule> > rules);
    static void makeCallsTransitive(unsigned int m_numFunctions,bool* m_calls);
    static bool* calc_m_calls(std::list<ref<Rule> > rules, unsigned int m_numFunctions,std::map<std::string, unsigned int>  m_functionIdx);


//    unsigned int getIdxVar(std::string v);
    std::string getVar(unsigned int idx);


    std::set<std::string> m_vars;

    static void makeDependsTransitive(unsigned int m_numVars, bool *m_depends);

//    std::map<std::string, std::set<std::string> > m_defined;
    std::map<std::string, std::set<std::string> > m_stillUsed;

    static std::set<std::string> getKnownVars(std::string f,std::map<std::string, std::set<std::string> >,unsigned int m_numFunctions,bool* m_proceeds,std::map<unsigned int, std::string>& m_idxFunction,std::map<std::string, unsigned int>  m_functionIdx);

    static std::set<std::string> getStillUsed(std::string f,
                                              std::map<std::string, std::set<std::string> > m_stillUsed,
                                              unsigned int m_numFunctions,
                                              bool* m_calls,
                                              std::map<unsigned int, std::string>& m_idxFunction,
                                              std::map<std::string, unsigned int> m_functionIdx);
    static std::set<unsigned int> getNotNeeded(std::string f, std::list<std::string> vars,std::map<std::string, std::set<std::string> >,unsigned int m_numFunctions,bool* m_proceeds,std::map<unsigned int, std::string>& m_idxFunction,std::map<std::string, unsigned int>  m_functionIdx);

    static std::set<std::string> computeReachableFuns(std::list<ref<Rule> > rules);

    static bool isRecursiveCall(std::string f);
    static bool isNondef(std::string v);



private:
    Slicer(const Slicer &);
    Slicer &operator=(const Slicer &);

};

#endif // SLICER_H
