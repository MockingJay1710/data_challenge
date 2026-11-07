## et si on cherche a minimiser directement la MAE ?

- la perte utilisee est la MAE, la question est c quoi le meilleur predicteur theorique pour la minimiser
- dans le cours, on a vu que pour la perte quadratique c etait $f^*(x)=\mathbb E[Y\mid X=x]$ 
- montrons que pour la MAE c la mediane
	![[Pasted image 20261107145625.png]]
---

## questions ?

- pouquoi pas de p1q0 ni p0q1 ?
	- pas de p0q1 car on veut predire quand le train est encore 2 gare derriere
	- pas de p1q0 notre train peut etre le suivant qui arrive ???
- peut on utiliser juste les gares precedentes ? (p0q2, ...)
- peut on utiliser juste les trains precedents ? (p2q0, ...)
- si notre train fait un retard p0q2 = r, plausiblement il ne pourra pas le combler vers notre gare, du coup on pourra teste $\text{p0q0}\approx\text{p0q2}$ ??? ou bien mediane des retards faits avant ??
- on pourra tester la mediane des retards fait par les autres trains dans la gare cible, $p0q0=\text{MED}(p2q0, p3q0, p4q0)$ ??
- combiner les deux??
- chercher des specificites des gares ??? fine tuning?
- entrainer des modeles qui minimise la perte absolue.
- les comparer avec des modeles qui minimise la perte quadratique.
![[Pasted image 20261107154203.png]]
