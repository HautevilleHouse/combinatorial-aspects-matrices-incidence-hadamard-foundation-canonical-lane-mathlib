import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean

structure DesignTheoryPackage where
  v : ℕ
  k : ℕ
  λ : ℕ
  blockCollection : Set (Set (Fin v))
  tDesignProperty : Prop
  balancedProperty : Prop
  tDesignClosed : tDesignProperty
  balancedClosed : balancedProperty

structure DesignTheoryEvidence (D : DesignTheoryPackage) where
  tDesignClosed : D.tDesignProperty
  balancedClosed : D.balancedProperty

def DesignTheoryClosed (D : DesignTheoryPackage) : Prop :=
  D.tDesignProperty ∧ D.balancedProperty

theorem design_theory_closed_from_evidence (D : DesignTheoryPackage)
    (E : DesignTheoryEvidence D) : DesignTheoryClosed D := by
  exact And.intro E.tDesignClosed E.balancedClosed

end CombinatorialAspectsMatricesIncidenceHadamardFoundationCanonicalLaneLean
end HautevilleHouse