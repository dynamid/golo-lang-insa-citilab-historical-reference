# Copyright (c) 2012-2015 Institut National des Sciences Appliquées de Lyon (INSA-Lyon)
#
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html

# Quick and dirty script to generate the arithmetic operation methods

TYPES = [ :Character, :Integer, :Long, :Double, :Float ]

OPS = [ :plus, :minus, :divide, :times, :modulo ]

OPS_SYMB = {
  :plus => '+',
  :minus => '-',
  :times => '*',
  :divide => '/',
  :modulo => '%'
}

PRIM = {
  :Character => :char,
  :Integer => :int,
  :Long => :long,
  :Float => :float,
  :Double => :double
}

WEIGHT = {
  :Character => 1,
  :Integer => 2,
  :Long => 3,
  :Float => 4,
  :Double => 5
}

TYPES.each do |type|
  OPS.each do |op|
    puts "public static Object #{op}(#{type} a, #{type} b) {"
    puts "  return a #{OPS_SYMB[op]} b;"
    puts "}"
    puts
  end
end

combinations = TYPES.combination(2).to_a
combinations = combinations + combinations.map { |pair| [pair[1], pair[0]] }
combinations.each do |pair|
  left = pair[0]
  right = pair[1]
  OPS.each do |op|
    puts "public static Object #{op}(#{left} a, #{right} b) {"
    if WEIGHT[left] < WEIGHT[right]
      puts "  return ((#{PRIM[right]}) a) #{OPS_SYMB[op]} b;"
    else
      puts "  return a #{OPS_SYMB[op]} ((#{PRIM[left]}) b);"
    end
    puts "}"
    puts
  end
end

