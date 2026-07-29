import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure IncidenceMatrixPackage where
  pointSet : Type u
  blockSet : Type v
  incidenceFunction : pointSet → blockSet → Prop
  constantBlockSize : Prop
  constantReplicationNumber : Prop
  symmetricDesign : Prop
  balancedIncompleteBlockDesign : Prop
  incidenceMatrixFullRank : Prop

structure IncidenceMatrixEvidence (I : IncidenceMatrixPackage) where
  constantBlockSizeClosed : I.constantBlockSize
  constantReplicationNumberClosed : I.constantReplicationNumber
  symmetricDesignClosed : I.symmetricDesign
  balancedIncompleteBlockDesignClosed : I.balancedIncompleteBlockDesign
  incidenceMatrixFullRankClosed : I.incidenceMatrixFullRank

def IncidenceMatrixClosed (I : IncidenceMatrixPackage) : Prop :=
  I.constantBlockSize ∧ I.constantReplicationNumber ∧ I.symmetricDesign ∧
  I.balancedIncompleteBlockDesign ∧ I.incidenceMatrixFullRank

theorem incidence_matrix_closed_from_evidence (I : IncidenceMatrixPackage)
    (E : IncidenceMatrixEvidence I) : IncidenceMatrixClosed I := by
  exact And.intro E.constantBlockSizeClosed
    (And.intro E.constantReplicationNumberClosed
      (And.intro E.symmetricDesignClosed
        (And.intro E.balancedIncompleteBlockDesignClosed
          E.incidenceMatrixFullRankClosed)))

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse
