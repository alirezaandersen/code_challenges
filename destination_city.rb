
def dest_city(paths)
  res = paths.map {|p| p[1]} - paths.map {|p| p[0] }
  res[0]
end
# You are given the array paths, where paths[i] = [cityAi, cityBi] means there exists a direct path going from cityAi to cityBi. Return the destination city, that is, the city without any path outgoing to another city.
#
# It is guaranteed that the graph of paths forms a line without any loop, therefore, there will be exactly one destination city.

# Input:
path1 = [["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]
# Output: "Sao Paulo"

# Input:
path2 = [["B","C"],["D","B"],["C","A"]]
# Output: "A"

# Input:
path3 = [["A","Z"]]
# Output: "Z"

# Input:
path4= [["jMgaf WaWA","iinynVdmBz"],[" QCrEFBcAw","wRPRHznLWS"],["iinynVdmBz","OoLjlLFzjz"],["OoLjlLFzjz"," QCrEFBcAw"],["IhxjNbDeXk","jMgaf WaWA"],["jmuAYy vgz","IhxjNbDeXk"]]
# Output: "wRPRHznLWS"

paths = [path1, path2, path3, path4]

def process(paths)
  paths.each { |p| puts "#{dest_city(p)}" }
end

process(paths)
