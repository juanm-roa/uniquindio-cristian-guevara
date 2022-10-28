defmodule Challenge_1 do
  @moduledoc """

  Documentación del modulo 'Challenge_1'

  Este modulo da funciones de utilidad, para encontrar la solución al problema
  'División por 3', este problema consiste en que a partir de una serie formada por
  un número n, contar la cantidad que hay desde un punto a a un punto b que son divisibles por 3.

  Serie:
    Si de entrada es 1 se obtiene = 1
    Si de entrada es 2 se obtiene = 12
    Si de entrada es 3 se obtiene = 123
    Si de entrada es n se obtiene = 123...n

  """

  @doc """

  Función para validar si la serie generada por el valor ingresado
  es divisible por 3.

  Parametros:
    n: número para generar la serie

  Retorna:
    1: Si la serie generada es divisible por 3
    0: Si la serie generada no es divisible por 3

  """
  def is_divisible_by_3(n) do
    mod = rem(n, 3)
    if mod == 0 or mod == 2 do
      1
    else
      0
    end
  end

  @doc """

  Función para encontrar la cantidad de series generadas por cada valor que
  son divisibles por 3 entre un rango desde a hasta b.

  Parametros:
    a: valor inferior del rango
    b: valor superior del rango

  """
  def count_divible_by_3(a, b) when a <= b do
    is_divisible_by_3(a) + count_divible_by_3(a + 1, b)
  end

  def count_divible_by_3(_, _) do 0 end

  @doc """

  Función para ejecutar una interfaz en la consola, para
  comprobar algunos casos de prueba rápidos

  Ejemplo:
    2
    1 4
    4 5

  Resultado:
    Case 1: 2
    Case 2: 1

  """
  def test_console() do
    {cases, _} = IO.gets("") |> Integer.parse
    Enum.each(1..cases, fn(caseno) ->
        [a, b] = IO.gets("") |> String.split |> Enum.map(&String.to_integer/1)
        IO.puts("Case #{caseno}: #{count_divible_by_3(a, b)}")
    end)
  end

end

alias Challenge_1

Challenge_1.test_console()
