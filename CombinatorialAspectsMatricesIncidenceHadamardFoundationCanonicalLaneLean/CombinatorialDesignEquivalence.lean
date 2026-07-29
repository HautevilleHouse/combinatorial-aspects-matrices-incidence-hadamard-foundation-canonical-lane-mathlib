import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure CombinatorialDesignEquivalencePackage where
  hadamardMatrix : HadamardMatrixPackage
  incidenceMatrix : IncidenceMatrixPackage
  equivalenceRelation : Prop
  hadamardFromDesign : Prop
  designFromHadamard : Prop
  symmetricConferenceMatrix : Prop
  classificationUpToEquivalence : Prop

structure CombinatorialDesignEquivalenceEvidence
    (C : CombinatorialDesignEquivalencePackage) where
  equivalenceRelationClosed : C.equivalenceRelation
  hadamardFromDesignClosed : C.hadamardFromDesign
  designFromHadamardClosed : C.designFromHadamard
  symmetricConferenceMatrixClosed : C.symmetricConferenceMatrix
  classificationUpToEquivalenceClosed : C.classificationUpToEquivalence

def CombinatorialDesignEquivalenceClosed
    (C : CombinatorialDesignEquivalencePackage) : Prop :=
  C.equivalenceRelation ∧ C.hadamardFromDesign ∧ C.designFromHadamard ∧
  C.symmetricConferenceMatrix ∧ C.classificationUpToEquivalence

theorem combinatorial_design_equivalence_closed_from_evidence
    (C : CombinatorialDesignEquivalencePackage)
    (E : CombinatorialDesignEquivalenceEvidence C) :
    CombinatorialDesignEquivalenceClosed C := by
  exact And.intro E.equivalenceRelationClosed
    (And.intro E.hadamardFromDesignClosed
      (And.intro E.designFromHadamardClosed
        (And.intro E.symmetricConferenceMatrixClosed
          E.classificationUpToEquivalenceClosed)))

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse
