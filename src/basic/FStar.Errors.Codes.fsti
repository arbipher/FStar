(*
   Copyright 2008-2020 Microsoft Research

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
module FStar.Errors.Codes

(* Kinds of errors. *)
type error_flag =
  | CFatal          //CFatal: these are reported using a raise_error: compiler cannot progress
  | CAlwaysError    //CAlwaysError: these errors are reported using log_issue and cannot be suppressed
                    //the compiler can progress after reporting them
  | CError          //CError: these are reported as errors using log_issue
                    //        but they can be turned into warnings or silenced
  | CWarning        //CWarning: reported using log_issue as warnings by default;
                    //          then can be silenced or escalated to errors
  | CSilent         //CSilent: never the default for any issue, but warnings can be silenced

(* The list of all available error codes *)
type raw_error =
  | Error_DependencyAnalysisFailed
  | Error_IDETooManyPops
  | Error_IDEUnrecognized
  | Error_InductiveTypeNotSatisfyPositivityCondition
  | Error_InvalidUniverseVar
  | Error_MissingFileName
  | Error_ModuleFileNameMismatch
  | Error_OpPlusInUniverse
  | Error_OutOfRange
  | Error_ProofObligationFailed
  | Error_TooManyFiles
  | Error_TypeCheckerFailToProve
  | Error_TypeError
  | Error_UncontrainedUnificationVar
  | Error_UnexpectedGTotComputation
  | Error_UnexpectedInstance
  | Error_UnknownFatal_AssertionFailure
  | Error_Z3InvocationError
  | Error_IDEAssertionFailure
  | Error_Z3SolverError
  | Fatal_AbstractTypeDeclarationInInterface
  | Fatal_ActionMustHaveFunctionType
  | Fatal_AlreadyDefinedTopLevelDeclaration
  | Fatal_ArgumentLengthMismatch
  | Fatal_AssertionFailure
  | Fatal_AssignToImmutableValues
  | Fatal_AssumeValInInterface
  | Fatal_BadlyInstantiatedSynthByTactic
  | Fatal_BadSignatureShape
  | Fatal_BinderAndArgsLengthMismatch
  | Fatal_BothValAndLetInInterface
  | Fatal_CardinalityConstraintViolated
  | Fatal_ComputationNotTotal
  | Fatal_ComputationTypeNotAllowed
  | Fatal_ComputedTypeNotMatchAnnotation
  | Fatal_ConstructorArgLengthMismatch
  | Fatal_ConstructorFailedCheck
  | Fatal_ConstructorNotFound
  | Fatal_ConstsructorBuildWrongType
  | Fatal_CycleInRecTypeAbbreviation
  | Fatal_DataContructorNotFound
  | Fatal_DefaultQualifierNotAllowedOnEffects
  | Fatal_DefinitionNotFound
  | Fatal_DisjuctivePatternVarsMismatch
  | Fatal_DivergentComputationCannotBeIncludedInTotal
  | Fatal_DuplicateInImplementation
  | Fatal_DuplicateModuleOrInterface
  | Fatal_DuplicateTopLevelNames
  | Fatal_DuplicateTypeAnnotationAndValDecl
  | Fatal_EffectCannotBeReified
  | Fatal_EffectConstructorNotFullyApplied
  | Fatal_EffectfulAndPureComputationMismatch
  | Fatal_EffectNotFound
  | Fatal_EffectsCannotBeComposed
  | Fatal_ErrorInSolveDeferredConstraints
  | Fatal_ErrorsReported
  | Fatal_EscapedBoundVar
  | Fatal_ExpectedArrowAnnotatedType
  | Fatal_ExpectedGhostExpression
  | Fatal_ExpectedPureExpression
  | Fatal_ExpectNormalizedEffect
  | Fatal_ExpectTermGotFunction
  | Fatal_ExpectTrivialPreCondition
  | Fatal_FailToCompileNativeTactic
  | Fatal_FailToExtractNativeTactic
  | Fatal_FailToProcessPragma
  | Fatal_FailToResolveImplicitArgument
  | Fatal_FailToSolveUniverseInEquality
  | Fatal_FieldsNotBelongToSameRecordType
  | Fatal_ForbiddenReferenceToCurrentModule
  | Fatal_FreeVariables
  | Fatal_FunctionTypeExpected
  | Fatal_IdentifierNotFound
  | Fatal_IllAppliedConstant
  | Fatal_IllegalCharInByteArray
  | Fatal_IllegalCharInOperatorName
  | Fatal_IllTyped
  | Fatal_ImpossibleAbbrevLidBundle
  | Fatal_ImpossibleAbbrevRenameBundle
  | Fatal_ImpossibleInductiveWithAbbrev
  | Fatal_ImpossiblePrePostAbs
  | Fatal_ImpossiblePrePostArrow
  | Fatal_ImpossibleToGenerateDMEffect
  | Fatal_ImpossibleTypeAbbrevBundle
  | Fatal_ImpossibleTypeAbbrevSigeltBundle
  | Fatal_IncludeModuleNotPrepared
  | Fatal_IncoherentInlineUniverse
  | Fatal_IncompatibleKinds
  | Fatal_IncompatibleNumberOfTypes
  | Fatal_IncompatibleSetOfUniverse
  | Fatal_IncompatibleUniverse
  | Fatal_InconsistentImplicitArgumentAnnotation
  | Fatal_InconsistentImplicitQualifier
  | Fatal_InconsistentQualifierAnnotation
  | Fatal_InferredTypeCauseVarEscape
  | Fatal_InlineRenamedAsUnfold
  | Fatal_InsufficientPatternArguments
  | Fatal_InterfaceAlreadyProcessed
  | Fatal_InterfaceNotImplementedByModule
  | Fatal_InterfaceWithTypeImplementation
  | Fatal_InvalidFloatingPointNumber
  | Fatal_InvalidFSDocKeyword
  | Fatal_InvalidIdentifier
  | Fatal_InvalidLemmaArgument
  | Fatal_InvalidNumericLiteral
  | Fatal_InvalidRedefinitionOfLexT
  | Fatal_InvalidUnicodeInStringLiteral
  | Fatal_InvalidUTF8Encoding
  | Fatal_InvalidWarnErrorSetting
  | Fatal_LetBoundMonadicMismatch
  | Fatal_LetMutableForVariablesOnly
  | Fatal_LetOpenModuleOnly
  | Fatal_LetRecArgumentMismatch
  | Fatal_MalformedActionDeclaration
  | Fatal_MismatchedPatternType
  | Fatal_MismatchUniversePolymorphic
  | Fatal_MissingDataConstructor
  | Fatal_MissingExposeInterfacesOption
  | Fatal_MissingFieldInRecord
  | Fatal_MissingImplementation
  | Fatal_MissingImplicitArguments
  | Fatal_MissingInterface
  | Fatal_MissingNameInBinder
  | Fatal_MissingPrimsModule
  | Fatal_MissingQuantifierBinder
  | Fatal_ModuleExpected
  | Fatal_ModuleFileNotFound
  | Fatal_ModuleFirstStatement
  | Fatal_ModuleNotFound
  | Fatal_ModuleOrFileNotFound
  | Fatal_MonadAlreadyDefined
  | Fatal_MoreThanOneDeclaration
  | Fatal_MultipleLetBinding
  | Fatal_NameNotFound
  | Fatal_NameSpaceNotFound
  | Fatal_NegativeUniverseConstFatal_NotSupported
  | Fatal_NoFileProvided
  | Fatal_NonInductiveInMutuallyDefinedType
  | Fatal_NonLinearPatternNotPermitted
  | Fatal_NonLinearPatternVars
  | Fatal_NonSingletonTopLevel
  | Fatal_NonSingletonTopLevelModule
  | Error_NonTopRecFunctionNotFullyEncoded
  | Fatal_NonTrivialPreConditionInPrims
  | Fatal_NonVariableInductiveTypeParameter
  | Fatal_NotApplicationOrFv
  | Fatal_NotEnoughArgsToEffect
  | Fatal_NotEnoughArgumentsForEffect
  | Fatal_NotFunctionType
  | Fatal_NotSupported
  | Fatal_NotTopLevelModule
  | Fatal_NotValidFStarFile
  | Fatal_NotValidIncludeDirectory
  | Fatal_OneModulePerFile
  | Fatal_OpenGoalsInSynthesis
  | Fatal_OptionsNotCompatible
  | Fatal_OutOfOrder
  | Fatal_ParseErrors
  | Fatal_ParseItError
  | Fatal_PolyTypeExpected
  | Fatal_PossibleInfiniteTyp
  | Fatal_PreModuleMismatch
  | Fatal_QulifierListNotPermitted
  | Fatal_RecursiveFunctionLiteral
  | Fatal_ReflectOnlySupportedOnEffects
  | Fatal_ReservedPrefix
  | Fatal_SMTOutputParseError
  | Fatal_SMTSolverError
  | Fatal_SyntaxError
  | Fatal_SynthByTacticError
  | Fatal_TacticGotStuck
  | Fatal_TcOneFragmentFailed
  | Fatal_TermOutsideOfDefLanguage
  | Fatal_ToManyArgumentToFunction
  | Fatal_TooManyOrTooFewFileMatch
  | Fatal_TooManyPatternArguments
  | Fatal_TooManyUniverse
  | Fatal_TypeMismatch
  | Fatal_TypeWithinPatternsAllowedOnVariablesOnly
  | Fatal_UnableToReadFile
  | Fatal_UnepxectedOrUnboundOperator
  | Fatal_UnexpectedBinder
  | Fatal_UnexpectedBindShape
  | Fatal_UnexpectedChar
  | Fatal_UnexpectedComputationTypeForLetRec
  | Fatal_UnexpectedConstructorType
  | Fatal_UnexpectedDataConstructor
  | Fatal_UnexpectedEffect
  | Fatal_UnexpectedEmptyRecord
  | Fatal_UnexpectedExpressionType
  | Fatal_UnexpectedFunctionParameterType
  | Fatal_UnexpectedGeneralizedUniverse
  | Fatal_UnexpectedGTotForLetRec
  | Fatal_UnexpectedGuard
  | Fatal_UnexpectedIdentifier
  | Fatal_UnexpectedImplicitArgument
  | Fatal_UnexpectedImplictArgument
  | Fatal_UnexpectedInductivetype
  | Fatal_UnexpectedLetBinding
  | Fatal_UnexpectedModuleDeclaration
  | Fatal_UnexpectedNumberOfUniverse
  | Fatal_UnexpectedNumericLiteral
  | Fatal_UnexpectedPattern
  | Fatal_UnexpectedPosition
  | Fatal_UnExpectedPreCondition
  | Fatal_UnexpectedReturnShape
  | Fatal_UnexpectedSignatureForMonad
  | Fatal_UnexpectedTerm
  | Fatal_UnexpectedTermInUniverse
  | Fatal_UnexpectedTermType
  | Fatal_UnexpectedTermVQuote
  | Fatal_UnexpectedUniversePolymorphicReturn
  | Fatal_UnexpectedUniverseVariable
  | Fatal_UnfoldableDeprecated
  | Fatal_UnificationNotWellFormed
  | Fatal_Uninstantiated
  | Error_UninstantiatedUnificationVarInTactic
  | Fatal_UninstantiatedVarInTactic
  | Fatal_UniverseMightContainSumOfTwoUnivVars
  | Fatal_UniversePolymorphicInnerLetBound
  | Fatal_UnknownAttribute
  | Fatal_UnknownToolForDep
  | Fatal_UnrecognizedExtension
  | Fatal_UnresolvedPatternVar
  | Fatal_UnsupportedConstant
  | Fatal_UnsupportedDisjuctivePatterns
  | Fatal_UnsupportedQualifier
  | Fatal_UserTacticFailure
  | Fatal_ValueRestriction
  | Fatal_VariableNotFound
  | Fatal_WrongBodyTypeForReturnWP
  | Fatal_WrongDataAppHeadFormat
  | Fatal_WrongDefinitionOrder
  | Fatal_WrongResultTypeAfterConstrutor
  | Fatal_WrongTerm
  | Fatal_WhenClauseNotSupported
  | Unused01
  | Warning_AddImplicitAssumeNewQualifier
  | Warning_AdmitWithoutDefinition
  | Warning_CachedFile
  | Warning_DefinitionNotTranslated
  | Warning_DependencyFound
  | Warning_DeprecatedEqualityOnBinder
  | Warning_DeprecatedOpaqueQualifier
  | Warning_DocOverwrite
  | Warning_FileNotWritten
  | Warning_Filtered
  | Warning_FunctionLiteralPrecisionLoss
  | Warning_FunctionNotExtacted
  | Warning_HintFailedToReplayProof
  | Warning_HitReplayFailed
  | Warning_IDEIgnoreCodeGen
  | Warning_IllFormedGoal
  | Warning_InaccessibleArgument
  | Warning_IncoherentImplicitQualifier
  | Warning_IrrelevantQualifierOnArgumentToReflect
  | Warning_IrrelevantQualifierOnArgumentToReify
  | Warning_MalformedWarnErrorList
  | Warning_MetaAlienNotATmUnknown
  | Warning_MultipleAscriptions
  | Warning_NondependentUserDefinedDataType
  | Warning_NonListLiteralSMTPattern
  | Warning_NormalizationFailure
  | Warning_NotDependentArrow
  | Warning_NotEmbedded
  | Warning_PatternMissingBoundVar  //AR: this is deprecated, use Warning_SMTPatternIllFormed instead
                                    //    not removing it so as not to mess up the error numbers
  | Warning_RecursiveDependency
  | Warning_RedundantExplicitCurrying
  | Warning_SMTPatTDeprecated
  | Warning_SMTPatternIllFormed
  | Warning_TopLevelEffect
  | Warning_UnboundModuleReference
  | Warning_UnexpectedFile
  | Warning_UnexpectedFsTypApp
  | Warning_UnexpectedZ3Output
  | Warning_UnprotectedTerm
  | Warning_UnrecognizedAttribute
  | Warning_UpperBoundCandidateAlreadyVisited
  | Warning_UseDefaultEffect
  | Warning_WrongErrorLocation
  | Warning_Z3InvocationWarning
  | Warning_PluginNotImplemented
  | Warning_MissingInterfaceOrImplementation
  | Warning_ConstructorBuildsUnexpectedType
  | Warning_ModuleOrFileNotFoundWarning
  | Error_NoLetMutable
  | Error_BadImplicit
  | Warning_DeprecatedDefinition
  | Fatal_SMTEncodingArityMismatch
  | Warning_Defensive
  | Warning_CantInspect
  | Warning_NilGivenExplicitArgs
  | Warning_ConsAppliedExplicitArgs
  | Warning_UnembedBinderKnot
  | Fatal_TacticProofRelevantGoal
  | Warning_TacAdmit
  | Fatal_IncoherentPatterns
  | Error_NoSMTButNeeded
  | Fatal_UnexpectedAntiquotation
  | Fatal_SplicedUndef
  | Fatal_SpliceUnembedFail
  | Warning_ExtractionUnexpectedEffect
  | Error_DidNotFail
  | Warning_UnappliedFail
  | Warning_QuantifierWithoutPattern
  | Error_EmptyFailErrs
  | Warning_logicqualifier
  | Fatal_CyclicDependence
  | Error_InductiveAnnotNotAType
  | Fatal_FriendInterface
  | Error_CannotRedefineConst
  | Error_BadClassDecl
  | Error_BadInductiveParam
  | Error_FieldShadow
  | Error_UnexpectedDM4FType
  | Fatal_EffectAbbreviationResultTypeMismatch
  | Error_AlreadyCachedAssertionFailure
  | Error_MustEraseMissing
  | Warning_EffectfulArgumentToErasedFunction
  | Fatal_EmptySurfaceLet
  | Warning_UnexpectedCheckedFile
  | Fatal_ExtractionUnsupported
  | Warning_SMTErrorReason
  | Warning_CoercionNotFound
  | Error_QuakeFailed
  | Error_IllSMTPat
  | Error_IllScopedTerm
  | Warning_UnusedLetRec
  | Fatal_Effects_Ordering_Coherence
  | Warning_BleedingEdge_Feature
  | Warning_IgnoredBinding
  | Warning_CouldNotReadHints
  | Fatal_BadUvar
  | Warning_WarnOnUse
  | Warning_DeprecatedAttributeSyntax
  | Warning_DeprecatedGeneric
  | Error_BadSplice
  | Error_UnexpectedUnresolvedUvar
  | Warning_UnfoldPlugin
  | Error_LayeredMissingAnnot
  | Error_CallToErased
  | Error_ErasedCtor
  | Error_RemoveUnusedTypeParameter
  | Warning_NoMagicInFSharp
  | Error_BadLetOpenRecord
  | Error_UnexpectedTypeclassInstance
  | Warning_AmbiguousResolveImplicitsHook
  | Warning_SplitAndRetryQueries
  | Warning_DeprecatedLightDoNotation
  | Warning_FailedToCheckInitialTacticGoal
  | Warning_Adhoc_IndexedEffect_Combinator
  | Error_PluginDynlink
  | Error_InternalQualifier
  | Warning_NameEscape
  | Warning_UnexpectedZ3Stderr

type error_setting = raw_error * error_flag * int

val default_settings : list error_setting
