import CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean.HadamardMatrix

/-! 
# Incidence Structure Package
-/

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure IncidenceStructure where
  points : Type u
  blocks : Type v
  incidence : points → blocks → Prop
  v : ℕ
  k : ℕ
  λ : ℕ
  regular : ℕ → Prop
  pairwiseBalanced : Prop

structure IncidenceEvidence (I : IncidenceStructure) where
  regularClosed : I.regular I.v
  pairwiseBalancedClosed : I.pairwiseBalanced

def IncidenceClosed (I : IncidenceStructure) : Prop :=
  I.regular I.v ∧ I.pairwiseBalanced

theorem incidence_closed_from_evidence (I : IncidenceStructure) (E : IncidenceEvidence I) :
    IncidenceClosed I := by
  exact And.intro E.regularClosed E.pairwiseBalancedClosed

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse