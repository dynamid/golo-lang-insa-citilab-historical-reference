module golotest.execution.Operators

function plus_one = |a| {
  return a + 1
}

function minus_one = |a| {
  return a - 1
}

function half = |a| {
  return a / 2
}

function twice = |a| {
  return a * 2
}

function compute_92 = {
  return ((1 + 2 + 3) * (5) * 6 + (10 / 2) - 1) / 2
}

function eq = |a, b| {
  return a == b
}

function at_least_5 = |a| {
  if a < 5 {
    return 5
  } else {
    return a
  }
}

function between_1_and_10_or_20_and_30 = |a| {
  return ((a >=1) and (a <= 10)) or ((a >= 20) and (a <= 30))
}