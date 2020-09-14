list = [1,3,4,1,2,3,4,4,4,2,1,1,2,3,3,2,1,3,5]

p list
  .group_by(&:itself)
  .each_with_object({}) { | (k,v), hash| hash[k] =v.size}