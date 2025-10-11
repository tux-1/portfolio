import 'package:flutter/cupertino.dart';

class ProjectModel {
  final String name;
  final String shortDescription;
  final String longDescription;
  final String? codeUrl;
  final String? type;
  final String? deployUrl; // redirected to from the name
  final Widget? preview;

  ProjectModel({
    required this.name,
    required this.shortDescription,
    required this.longDescription,
    this.type,
    this.codeUrl,
    this.deployUrl,
    this.preview,
  });
}

final List<ProjectModel> projects = [
  ProjectModel(
    name: 'EasyAttend',
    type: 'Freelance Gig',
    shortDescription: 'Secure attendance system using QR code and geolocation.',
    longDescription:
        'Developed a secure attendance system that uses QR code scanning and geolocation to streamline event check-in, preventing fraudulent entries. Designed a dual-interface system for both hosts and attendees, providing a seamless and secure registration experience.',
    codeUrl: 'https://github.com/tux-1/easy-attend',
    deployUrl: null,
    preview: null,
  ),
  ProjectModel(
    name: 'OnMyWay',
    type: 'Freelance Gig',

    shortDescription: 'Comprehensive e-commerce and ride-booking application.',
    longDescription:
        'Built a comprehensive e-commerce and ride-booking application, handling complex user workflows across multiple business domains. Ensured high performance and offline functionality through efficient state management and local data persistence.',
    codeUrl: 'https://github.com/tux-1/on_my_way',
    deployUrl: null,
    preview: null,
  ),
  ProjectModel(
    name: '3trek',
    type: 'Freelance Gig',

    shortDescription:
        'Ride-booking platform with live GPS tracking and route optimization.',
    longDescription:
        'Developed a ride-booking platform with a focus on driver-passenger matching, live GPS tracking, and dynamic route optimization. Built a dual-interface system for both passengers and drivers, complete with role-based authentication and real-time status updates.',
    codeUrl: null, // URL not provided in the original data
    deployUrl: null,
    preview: null,
  ),
  ProjectModel(
    name: 'HUCI Faculty Gateway',
    type: 'Freelance Gig',

    shortDescription:
        'Consulted on and integrated Firebase solutions for user management.',
    longDescription:
        'Consulted on and integrated Firebase solutions to manage multiple user types, improving data handling and system performance. Implemented real-time updates and user access controls, ensuring a stable and efficient system for all user groups.',
    codeUrl: null, // URL not explicitly provided in the original data
    deployUrl: null,
    preview: null,
  ),
  ProjectModel(
    name: 'ArdentChat',
    type: 'Group project',
    
    shortDescription:
        'A real-time chat application as part of the DEPI scholarship program.',
    longDescription:
        'Led the development team of ArdentChat, a real-time chat application as part of the DEPI scholarship program, that supports 1,000+ users. Established a version control workflow and provided technical leadership, ensuring code quality and efficient team collaboration.',
    codeUrl: 'https://github.com/tux-1/ardent-chat',
    deployUrl: null,
    preview: null,
  ),
  ProjectModel(
    name: 'Tamweeny',
    type: 'Graduation project',

    shortDescription:
        'An e-commerce application specializing in food supplies with functionalities for both customers and delivery personnel.',
    longDescription:
        'Developed Tamweeny, an e-commerce application specializing in food supplies with functionalities for both customers and delivery personnel. Integrated APIs, third-party services, and backend systems.',
    codeUrl: 'https://github.com/tux-1/tamweeny',
    deployUrl: null,
    preview: null,
  ),
];
