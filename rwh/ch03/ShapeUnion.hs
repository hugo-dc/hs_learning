-- file: ch03/ShapeUnion.hs
type Vector = (Double, Double)

data Shap = Circle Vector Double
          | Poly [Vector]
