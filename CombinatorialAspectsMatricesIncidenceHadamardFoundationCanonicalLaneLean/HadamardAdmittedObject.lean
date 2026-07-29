import CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean.HadamardDesign

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure HadamardSpace where
  carrier : Type
  structure : IncidenceStructure

structure HadamardAdmittedObject where
  space : HadamardSpace
  designExists : ∃ (D : HadamardDesign space.structure), HadamardDesignClosed D
  hadamardMatrixExists : ∃ (M : HadamardMatrix), HadamardMatrixClosed M
  conclusion : designExists ∧ hadamardMatrixExists

def HadamardWitnessClosed (O : HadamardAdmittedObject) : Prop :=
  O.designExists ∧ O.hadamardMatrixExists

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse