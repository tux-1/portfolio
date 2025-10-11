

class ExperienceModel {
  final String position;
  final String company;
  final String description;
  final String fromTo;

  ExperienceModel({
    required this.position,
    required this.company,
    required this.description,
    required this.fromTo,
  });
}

final List<ExperienceModel> experiences = [
  ExperienceModel(
    position: 'Flutter Developer', 
    company: 'Amwal Egy', 
    description:
        'Built and maintained two cross platform applications. Introduced unit testing and resolved 94+ critical legacy bugs to ensure stable delivery.', 
    fromTo: 'Mar. 2025 — Present', 
  ),

  ExperienceModel(
    position: 'Full Stack Mobile Developer', 
    company: 'Freelance', 
    description:
        'Successfully delivered over 5 fully functional mobile applications with 100% client satisfaction.', 
    fromTo: 'Jan. 2024 — Sep. 2025',
  ),
];
