import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure CombinatorialDesignPackage where
  pointSet : Type u
  blockSet : Type v
  incidence : pointSet → blockSet → ℤ
  tDesignParameter : ℕ
  constantLambda : ℕ
  fisherInequalityHolds : Prop
  symmetricDesignProperty : Prop

structure CombinatorialDesignEvidence (D : CombinatorialDesignPackage) where
  constantLambdaClosed : D.constantLambda
  fisherInequalityHoldsClosed : D.fisherInequalityHolds
  symmetricDesignPropertyClosed : D.symmetricDesignProperty

def CombinatorialDesignClosed (D : CombinatorialDesignPackage) : Prop :=
  D.constantLambda ∧ D.fisherInequalityHolds ∧ D.symmetricDesignProperty

theorem combinatorial_design_closed_from_evidence (D : CombinatorialDesignPackage) (E : CombinatorialDesignEvidence D) :
    CombinatorialDesignClosed D := by
  exact And.intro E.constantLambdaClosed
    (And.intro E.fisherInequalityHoldsClosed E.symmetricDesignPropertyClosed)

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse