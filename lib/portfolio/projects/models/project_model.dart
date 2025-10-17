import 'package:flutter/cupertino.dart';
import 'package:portfolio/home_page.dart';

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
    name: 'Portfolio',
    shortDescription: 'This website',
    longDescription: 'Personal portfolio website built with Flutter.',
    codeUrl: 'https://github.com/tux-1/portfolio',
    deployUrl: null,
    preview: HomePage(),
  ),
  ProjectModel(
    name: 'EasyAttend',
    type: 'Freelance Gig',
    shortDescription: 'Secure & easy attendance application',
    longDescription:
        'Developed a secure attendance system that uses QR code scanning and geolocation to streamline event check-in, preventing fraudulent entries.',
    deployUrl: null,
    codeUrl: 'https://github.com/tux-1/easy-attend',
    preview: Image.asset('assets/images/easyattend.jpg'),
  ),
  ProjectModel(
    name: 'OnMyWay',
    type: 'Freelance Gig',
    shortDescription: 'Comprehensive e-commerce and ride-booking application.',
    longDescription:
        'Built a comprehensive e-commerce and ride-booking mobile application using Flutter and OpenStreetMap.',
    codeUrl: 'https://github.com/tux-1/on_my_way',
    deployUrl: null,
    preview: Image.asset('assets/images/onmyway.png'),
  ),
  ProjectModel(
    name: '3trek',
    type: 'Freelance Gig',
    shortDescription:
        'Ride-booking platform with live GPS tracking and route optimization.',
    longDescription:
        'Developed a ride-booking platform with a focus on driver-passenger matching, live GPS tracking, and dynamic route optimization. Built a dual-interface system for both passengers and drivers, complete with role-based authentication and real-time status updates.',
    codeUrl: null,
    deployUrl: null,
    preview: Image.asset('assets/images/3trek.jpg'),
  ),
  ProjectModel(
    name: 'ArdentChat',
    type: 'Group project',
    shortDescription: 'A real-time chat application',
    longDescription:
        'Led the development team of ArdentChat as part of the DEPI scholarship program, that supports 1,000+ users. Established a version control workflow and provided technical leadership.',
    codeUrl: 'https://github.com/tux-1/ardent-chat',
    deployUrl: null,
    preview: Image.asset('assets/images/ardent-chat.jpg'),
  ),
  ProjectModel(
    name: 'Tamweeny',
    type: 'Graduation project',
    shortDescription:
        'An dual-interface e-commerce application for both customers and delivery personnel.',
    longDescription:
        'Developed Tamweeny, an e-commerce application specializing in food supplies with functionalities for both customers and delivery personnel.',
    codeUrl: 'https://github.com/tux-1/tamweeny',
    deployUrl: null,
    preview: null,
  ),
  ProjectModel(
    name: 'HUCI Faculty Gateway',
    type: 'Freelance Gig',
    shortDescription:
        'Faculty Platform for student management, course enrollment, and scheduling.',
    longDescription:
        'Consulted on and integrated Firebase solutions to manage multiple user types. Implemented real-time updates and user access controls.',
    codeUrl: null,
    deployUrl: null,
    preview: null,
  ),
];
