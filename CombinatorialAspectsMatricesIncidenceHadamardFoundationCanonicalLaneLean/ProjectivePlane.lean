import CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean.IncidenceStructure

/-!
# Projective Plane Package
-/

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure ProjectivePlane (I : IncidenceStructure) where
  order : ℕ
  anyTwoPointsUniqueLine : ∀ p q : I.points, p ≠ q → ∃! b : I.blocks, I.incidence p b ∧ I.incidence q b
  anyTwoLinesUniquePoint : ∀ b c : I.blocks, b ≠ c → ∃! p : I.points, I.incidence p b ∧ I.incidence p c
  existsQuadrangle : ∃ (p q r s : I.points), ∀ (b : I.blocks),
    ¬(I.incidence p b ∧ I.incidence q b ∧ I.incidence r b ∧ I.incidence s b)
  pointsCount : Fintype.card I.points = order^2 + order + 1
  blocksCount : Fintype.card I.blocks = order^2 + order + 1

structure ProjectivePlaneEvidence {I : IncidenceStructure} (P : ProjectivePlane I) where
  anyTwoPointsUniqueLineClosed : P.anyTwoPointsUniqueLine
  anyTwoLinesUniquePointClosed : P.anyTwoLinesUniquePoint
  existsQuadrangleClosed : P.existsQuadrangle
  pointsCountClosed : P.pointsCount
  blocksCountClosed : P.blocksCount

def ProjectivePlaneClosed {I : IncidenceStructure} (P : ProjectivePlane I) : Prop :=
  P.anyTwoPointsUniqueLine ∧ P.anyTwoLinesUniquePoint ∧ P.existsQuadrangle ∧ P.pointsCount ∧ P.blocksCount

theorem projective_plane_closed_from_evidence {I : IncidenceStructure} (P : ProjectivePlane I)
    (E : ProjectivePlaneEvidence P) : ProjectivePlaneClosed P := by
  exact And.intro E.anyTwoPointsUniqueLineClosed
    (And.intro E.anyTwoLinesUniquePointClosed
      (And.intro E.existsQuadrangleClosed
        (And.intro E.pointsCountClosed E.blocksCountClosed)))

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse