
def dest_city(paths)
    destination = []
    paths.map do |place|
      destination.push(place) unless destination.include?(place)
    end
    destination
end


# @param {String[][]} paths
# @return {String}
def dest_city(paths)
    destination = []
    # duplicates = []
    # count = 0
    paths.flatten.map do |place|
        if destination.include?(place)
            duplicates.each_with_index do |w, i|
                if w == place

                    puts "Des:: #{destination}"
                    # destination.delete(w)
                    destination << destination[i + 1]
                end
            end
        end
    end
    # puts "Count:: #{count}"
    # puts "Dup:: #{duplicates}"
    destination
end
# You are given the array paths, where paths[i] = [cityAi, cityBi] means there exists a direct path going from cityAi to cityBi. Return the destination city, that is, the city without any path outgoing to another city.
#
# It is guaranteed that the graph of paths forms a line without any loop, therefore, there will be exactly one destination city.
#
# Input: paths = [["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]
# Output: "Sao Paulo"
#
# Input: paths = [["B","C"],["D","B"],["C","A"]]
# Output: "A"
#
# Input: paths = [["A","Z"]]
# Output: "Z"
#
# Input: paths= [["jMgaf WaWA","iinynVdmBz"],[" QCrEFBcAw","wRPRHznLWS"],["iinynVdmBz","OoLjlLFzjz"],["OoLjlLFzjz"," QCrEFBcAw"],["IhxjNbDeXk","jMgaf WaWA"],["jmuAYy vgz","IhxjNbDeXk"]]
# Output: "wRPRHznLWS"
