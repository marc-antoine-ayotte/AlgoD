### Liste chaînée (Linked List)

Le fonctionnement générale des opérations est de parcourir les maillons
jusqu'à atteindre l'élément du bon index. La liste chaînée que l'on crée est relativement simple. On conserve un pointeur à la fin afin de faciliter la méthode append, qui n'a qu'à modifier le dernier pointeur. On garde également la taille afin de faciliter l'appel de la fonction size.
L'avantage de cette approche est qu'il sera plus facile d'implémenter un stack
efficace à l'aide de cette liste chaînée.


