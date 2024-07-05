1) ouvrir Windows PowerShell
2) Tapez la commande  « ssh votreusername@LD2052614 » et entrez ensuite votre mot de passe réseau (le même que pour une session Windows).
Tapez « yes » lorsqu’on vous demande d’ajouter le poste à votre liste d’hôtes connus.

Vous êtes maintenant connecté au poste Linux.

Remote Desktop :
Il faut préalablement avoir ouvert une session SSH pour que le remote desktop fonctionne.
Ouvrir l’application « Remote Desktop Connection ».

![image](https://github.com/corinnbrunelle/OSOAA-run/assets/170564987/f21b8599-f047-49fa-904a-6b7968c548b5)

Mettre le numéro du poste où vous vous connectez.

![image](https://github.com/corinnbrunelle/OSOAA-run/assets/170564987/28449dcf-821e-4a8e-8809-eee0a76c7fcd)


Dans l’onglet « Experience », mettre les paramètres suivants et cliquer sur connect :

![image](https://github.com/corinnbrunelle/OSOAA-run/assets/170564987/70ec721f-6734-4c55-bc68-c368e8034d86)

À votre première connexion, vous aurez ce message d’erreur du nom certificat, simplement cocher « Don’t ask me again… » et cliquer « Yes ».

Entrer vos identifiants réseau (même que windows).

Vous devriez maintenant être connecté au desktop.

Informations supplémentaires :
Bien que fonctionnel, l’outil de remote desktop n’est pas optimal et il peut parfois y avoir une latence assez importante pendant son utilisation. Il est plus facile de travailler par SSH lorsque possible.
Vos lecteurs réseau sont « mapper » dans le /mnt/votreusername/. Faites-moi savoir si jamais il vous en manque.



