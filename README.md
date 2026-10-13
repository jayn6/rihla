# rihla

A new Flutter project.
Palier2:
<img width="1906" height="867" alt="Screenshot 2026-10-13 180428" src="https://github.com/user-attachments/assets/e04336b8-df7a-4ac3-9a07-77cbc00c21ce" />

1. The avatar moves closer to the text because Expanded no longer takes the remaining space in the Row.
2. prenom is final because its value is set once and cannot be changed.
3. cs.primary is a color that comes from the theme while colors.teal is a fixed color , if we changed seedcolor cs.primary changes with the theme’s seedColor, while Colors.teal stays the same.
Palier3:
<img width="1887" height="528" alt="Screenshot 2026-10-13 180901" src="https://github.com/user-attachments/assets/54372ab3-8d42-4fb8-a887-1c2d5f15806d" />

4. The image looks brighter because the gradient is placed behind the image, so it cannot darken the image as intended
5.The image corners become square instead of rounded. 
6. right: 130 leaves space for the “Decouvrir” button.
Palier 4:
<img width="1905" height="1047" alt="Screenshot 2026-10-13 183152" src="https://github.com/user-attachments/assets/9e6403c8-2079-4d1b-9f33-cdc49de9e260" />

7.expanded allows the column to use the remaining width of the row so spacer can push the price to the right.

8. we add 8 lines in destinations.dart (nom,region,categorie,image,note,prix,duree,description) then the loop displays it automatically
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
