import canonicalLaneMathlib.AdmissibleClass
import CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean.HadamardMatrixPackage

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure HadamardConstructionPackage where
  hadamardMatrix : HadamardMatrixPackage
  incidenceFromHadamard : IncidenceStructurePackage
  designFromIncidence : CombinatorialDesignPackage
  constructionConsistent : Prop

structure HadamardConstructionEvidence (C : HadamardConstructionPackage) where
  constructionConsistentClosed : C.constructionConsistent
  hadamardClosed : HadamardMatrixClosed C.hadamardMatrix
  incidenceClosed : IncidenceStructureClosed C.incidenceFromHadamard
  designClosed : CombinatorialDesignClosed C.designFromIncidence

def HadamardConstructionClosed (C : HadamardConstructionPackage) : Prop :=
  C.constructionConsistent ∧
  HadamardMatrixClosed C.hadamardMatrix ∧
  IncidenceStructureClosed C.incidenceFromHadamard ∧
  CombinatorialDesignClosed C.designFromIncidence

theorem hadamard_construction_closed_from_evidence (C : HadamardConstructionPackage) (E : HadamardConstructionEvidence C) :
    HadamardConstructionClosed C := by
  exact And.intro E.constructionConsistentClosed
    (And.intro E.hadamardClosed
      (And.intro E.incidenceClosed E.designClosed))

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse