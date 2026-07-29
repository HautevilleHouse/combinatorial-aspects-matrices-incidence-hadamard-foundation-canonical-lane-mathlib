import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean.CombinatorialDesign

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure FiniteProjectivePlanePackage {I : IncidenceMatrixPackage} (D : CombinatorialDesignPackage I) where
  order : Nat
  lines : D.blocks
  points : D.points
  incidenceProperty : ∀ (p : Nat) (l : Nat), (p < points) → (l < lines) → ((I.matrix.get? l).bind (·.get? p) = some 1) ∨ ((I.matrix.get? l).bind (·.get? p) = some 0)

structure FiniteProjectivePlaneEvidence {I : IncidenceMatrixPackage} {D : CombinatorialDesignPackage I} (P : FiniteProjectivePlanePackage D) where
  orderPos : P.order ≥ 2
  incidencePropertyClosed : P.incidenceProperty

def FiniteProjectivePlaneClosed {I : IncidenceMatrixPackage} {D : CombinatorialDesignPackage I} (P : FiniteProjectivePlanePackage D) : Prop :=
  P.order ≥ 2 ∧ P.incidenceProperty

theorem finiteProjectivePlane_closed_from_evidence {I : IncidenceMatrixPackage} {D : CombinatorialDesignPackage I} (P : FiniteProjectivePlanePackage D) (E : FiniteProjectivePlaneEvidence P) : FiniteProjectivePlaneClosed P := by
  exact And.intro E.orderPos E.incidencePropertyClosed

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse
