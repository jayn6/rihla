# rihla
## tp4:
## Palier2:
<img width="1888" height="1007" alt="image" src="https://github.com/user-attachments/assets/cb573321-e02f-42af-8cb0-9d044dfd4572" />

## Palier2:
Q1. Yes, the previous screen was kept in the navigation stack.Navigator.push() adds DetailScreen on top.

Q2 using navigator push and detaild screen constructor in materialpageroute inside destination card then detailscreen receives the selected one.

q3 after removing clipbehaviour InkWell may appear outside the rounded card boundaries.
## Palier3:
q1 It checks all the TextFormField validators inside the Form.

q2 inputFormatters: Control what the user can enter while typing(in this case can only enter 8 numbers ) and validator check whether the phone empty when click on valid.

q3 when a screen is closed we call dispose() to release those resources and avoid memory leaks

<img width="1883" height="995" alt="image" src="https://github.com/user-attachments/assets/a604ecae-84aa-47a2-84e2-2571eb560d9c" />
## Palier4:
q1 readonly because the user must select a date not typing manually otherwise the user can enter invalid date.

q2 A getter calculates the value dynamically, so we don't need to update _total manually.

## Palier5:
q1 reservation is null , the user didnt click confirm 

q2 Don't use BuildContext across asynchronous gaps.

q3 A dialog is also part of the navigation stack 
<img width="1906" height="997" alt="Screenshot 2026-11-03 135358" src="https://github.com/user-attachments/assets/29fbc3d7-ee6a-4119-9234-3824f3259f63" />
## tp3:

## Palier2:
<img width="1906" height="867" alt="Screenshot 2026-10-13 180428" src="https://github.com/user-attachments/assets/e04336b8-df7a-4ac3-9a07-77cbc00c21ce" />

1. The avatar moves closer to the text because Expanded no longer takes the remaining space in the Row.
2. prenom is final because its value is set once and cannot be changed.
3. cs.primary is a color that comes from the theme while colors.teal is a fixed color , if we changed seedcolor cs.primary changes with the theme’s seedColor, while Colors.teal stays the same.
4. 
## Palier3:
<img width="1887" height="528" alt="Screenshot 2026-10-13 180901" src="https://github.com/user-attachments/assets/54372ab3-8d42-4fb8-a887-1c2d5f15806d" />

4. The image looks brighter because the gradient is placed behind the image, so it cannot darken the image as intended
5.The image corners become square instead of rounded. 
6. right: 130 leaves space for the “Decouvrir” button.
## Palier 4:
<img width="1905" height="1047" alt="Screenshot 2026-10-13 183152" src="https://github.com/user-attachments/assets/9e6403c8-2079-4d1b-9f33-cdc49de9e260" />

7.expanded allows the column to use the remaining width of the row so spacer can push the price to the right.

8. we add 8 lines in destinations.dart (nom,region,categorie,image,note,prix,duree,description) then the loop displays it automatically
## Getting Started
## Palier 5:
<img width="1906" height="1067" alt="Screenshot 2026-10-20 122939" src="https://github.com/user-attachments/assets/e336ded4-423d-4c2c-98d5-10ef9054d82f" />

9. without setstate the category value will change in the memory but the screen will not rebuild 
10.because getter calculates filtered  list and show the items for the selected category everytime build() runs so it stays updated
11.heroBanner can stay statelesswidget because its content does not based on the category selected


## Palier 6:
<img width="1901" height="867" alt="Screenshot 2026-10-20 123210" src="https://github.com/user-attachments/assets/cb352178-ca31-4314-b376-a0adfea1cfd3" />
<img width="1893" height="501" alt="image" src="https://github.com/user-attachments/assets/9112e549-d031-427c-93a6-306c6d01be4c" />

## Palier 7:
<img width="1913" height="1067" alt="Screenshot 2026-10-20 144446" src="https://github.com/user-attachments/assets/06c76c87-d009-46d9-91b2-a7a83710a1c4" />

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
