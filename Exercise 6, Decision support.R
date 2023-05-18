#Seminor six. decision analysis
#Looking at different options for model programming.
#main package for simulations is decisionSupport.
#Installing the package and recall it in the library.

install.packages("decisionSupport")
library(decisionSupport)
#plot the impact pathway
#simple pathway transformed into codes using mermaid function
install.packages("DiagrammeR")
install.packages("mermaid")
library(DiagrammeR)
#impact pathway diagram
mermaid("graph LR
        Y(Yield)-->I(Income); linkStyle 0 stroke:green, stroke-width:1px
        M(Market price)-->I; linkStyle 1 stroke: green, stroke-width:1px
        I-->F(Final result); linkStyle 2 stroke: green, stroke-width:1.5px
        CL(Labor cost)-->F; linkStyle 3 stroke: red, stroke-width:1.5px")

mermaid("graph LR
        w(biomass)-->r(rootdev); linkStyle 0 stroke: red, stroke-width: 1.4px
        T(roottype)-->r; linkStyle 1 stroke: green, stroke-width:1.5px ")

mermaid("graph TD
        Y(Yield)-->I(Income); linkStyle 0 stroke:green, stroke-width:1px
        M(Market price)-->I; linkStyle 1 stroke: green, stroke-width:1px
        I-->F(Final result); linkStyle 2 stroke: green, stroke-width:1px
        CL(Labor cost)-->F; linkStyle 3 stroke: red, stroke-width:1px
        CM(Management cost)-->F; linkStyle 4 stroke: red, stroke-width:1px")
