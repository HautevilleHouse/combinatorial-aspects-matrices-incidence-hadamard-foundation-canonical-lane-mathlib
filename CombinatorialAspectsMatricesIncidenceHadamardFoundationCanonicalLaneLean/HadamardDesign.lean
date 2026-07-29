import CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean.ProjectivePlane

/-!
# Hadamard Design Package
-/

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure HadamardDesign (I : IncidenceStructure) where
  order : ℕ
  isProjectivePlane : ProjectivePlane I
  paramOrder : I.v = order^2 + order + 1 ∧ I.k = order + 1 ∧ I.λ = 1
  incidenceMatrixIsHadamard : ∃ (M : HadamardMatrix), M.n = I.v + 1

structure HadamardDesignEvidence {I : IncidenceStructure} (D : HadamardDesign I) where
  paramOrderClosed : D.paramOrder
  incidenceMatrixIsHadamardClosed : D.incidenceMatrixIsHadamard

def HadamardDesignClosed {I : IncidenceStructure} (D : HadamardDesign I) : Prop :=
  D.paramOrder ∧ D.incidenceMatrixIsHadamard

theorem hadamard_design_closed_from_evidence {I : IncidenceStructure} (D : HadamardDesign I)
    (E : HadamardDesignEvidence D) : HadamardDesignClosed D := by
  exact And.intro E.paramOrderClosed E.incidenceMatrixIsHadamardClosed

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse