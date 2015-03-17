defmodule Geom do
  @moduledoc """
  Provides geometry-related functions
  """
  @doc"""
  Calculates the area of a 2d geometric shape.
  The first argument is the shape, the second and third are dimensions.
  Dimensions default to 1.
    ex:  
       Geom.area(:rectangle, 4, 3) => 12
       Geom.area(:triangle, 4, 4)  => 8
       Geom.area(:ellipse, 2, 4)   => 25.13274
  """
  def area(shape, d1 \\ 1, d2 \\ 1)
  def area(:rectangle, d1, d2) when d2 >= 0 and d1 >= 0 do
    d1 * d2
  end

  def area(:triangle, d1, d2) when d2 >= 0 and d1 >= 0 do
    d1 * d2 / 2.0
  end

  def area(:ellipse, d1, d2) when d2 >= 0 and d1 >= 0 do
    :math.pi() * d1 * d2
  end
end

