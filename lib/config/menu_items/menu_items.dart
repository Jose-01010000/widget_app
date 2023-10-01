import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const appMenuItem = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subtitle: 'Varios botones en flutter.',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado.',
    link: '/card',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'Progress Indicators',
    subtitle: 'Generales y controlados.',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'SnackBar y Dialog',
    subtitle: 'Mensajes emergentes.',
    link: '/snackbar',
    icon: Icons.message,
  ),
  MenuItem(
    title: 'Animated',
    subtitle: 'Stateful Widgets animated.',
    link: '/animated',
    icon: Icons.animation,
  ),
];
