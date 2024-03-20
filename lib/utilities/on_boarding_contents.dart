class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Propone iniziative.",
    image: "assets/images/sammy-eventi.png",
    desc:
        "Tutto (e solo) ciò che puoi fare.\nA portata di mano. Non ti resta che scegliere la prossima avventura!",
  ),
  OnboardingContents(
    title: "E te le ricorda!",
    image: "assets/images/sammy-notifiche.png",
    desc:
        "Niente più \"non lo sapevo\".\n Ti avviseremo quando apriremo le iscrizioni. E quando stanno per terminare",
  ),
  OnboardingContents(
    title: "Pagamenti easy.",
    image: "assets/images/sammy-pagamenti.png",
    desc:
        "Scegli l'evento. Paga la quota.\nTutto qua sopra\n Più semplice di così se more.",
  ),
];