import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure IncidenceStructurePackage where
  pointSet : Type u
  blockSet : Type v
  incidenceMatrix : pointSet → blockSet → ℤ
  constantRowSum : Prop
  constantColumnSum : Prop
  dualStructureDefined : Prop

structure IncidenceStructureEvidence (I : IncidenceStructurePackage) where
  constantRowSumClosed : I.constantRowSum
  constantColumnSumClosed : I.constantColumnSum
  dualStructureDefinedClosed : I.dualStructureDefined

def IncidenceStructureClosed (I : IncidenceStructurePackage) : Prop :=
  I.constantRowSum ∧ I.constantColumnSum ∧ I.dualStructureDefined

theorem incidence_structure_closed_from_evidence (I : IncidenceStructurePackage) (E : IncidenceStructureEvidence I) :
    IncidenceStructureClosed I := by
  exact And.intro E.constantRowSumClosed
    (And.intro E.constantColumnSumClosed E.dualStructureDefinedClosed)

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse