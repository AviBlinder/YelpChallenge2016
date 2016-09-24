library(RNeo4j)
library(visNetwork)
library(igraph)

#Part 1 - Connecting and creating Nodes + Relationships 
neo_location <- "http://ec2-52-54-30-128.compute-1.amazonaws.com:7474/db/data"
graph <- startGraph(neo_location,username="neo4j",password = "neo4j")
cypher(graph , "MATCH (n) RETURN n.name LIMIT 25")



####################################################################################
#clear(graph)

cypher(graph, "MATCH (p:Person) DETACH DELETE p") 
cypher(graph, "MATCH (c:Company) DETACH DELETE c")

nicole = createNode(graph, "Person", name="Nicole")
greta = createNode(graph, "Person", name="Greta") kenny = createNode(graph, "Person", name="Kenny") adam = createNode(graph, "Person", name="Adam")

neo4j = createNode(graph, "Company", name="Neo4j") digital = createNode(graph, "Company", name="Digital Insights") docker = createNode(graph, "Company", name="Docker")

createRel(nicole, "WORKS_FOR", neo4j)
createRel(greta, "WORKS_FOR", neo4j)
createRel(kenny, "WORKS_FOR", digital)
createRel(adam, "WORKS_FOR", docker)

createRel(greta, "KNOWS", adam)
createRel(nicole, "KNOWS", kenny)
createRel(kenny, "KNOWS", adam)

######
#Part 2 - Querying and visualizing
node_query = "
MATCH (n:Person)
RETURN n.name AS id,
n.name AS label,
LABELS(n)[0] AS group
"

edge_query = "
MATCH (n)-[r:KNOWS]->(m)
RETURN n.name AS from,
m.name AS to,
TYPE(r) AS label
"

nodes = cypher(graph, node_query)
edges = cypher(graph, edge_query)
nodes
edges
visNetwork(nodes, edges)
#visNetwork(
#    setNames(nodes, "id","label","group"),
#    setNames(nodes, "id"),
#    setNames(edges, c("from","to"))
#)


#Nodes can also be sized by a value:

neo4j = updateProp(neo4j, employees=1)
digital = updateProp(digital, employees=2) docker = updateProp(docker, employees=3)

node_query = "
MATCH (n)
RETURN n.name AS id,
n.name AS label,
LABELS(n)[0] AS group,
n.employees AS value
"

nodes = cypher(graph, node_query)
nodes[is.na(nodes)] = 1

nodes

#visNetwork(nodes, edges)
visNetwork(
  setNames(nodes, "id"),
  setNames(links, c("from", "to", "foo"))
)

