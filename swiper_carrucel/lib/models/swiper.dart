import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class SwiperNav extends StatefulWidget {
  const SwiperNav({super.key});

  @override
  State<SwiperNav> createState() => _SwiperNavState();
}

class _SwiperNavState extends State<SwiperNav> {
  final List<String> images = [
    "https://imgs.search.brave.com/GYPTCezSZ3cciGS4R2mMxdKkCj5pQ8RvM56Ca79Qu7s/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTMy/ODA1NzcwOC9lcy9m/b3RvL21hZHJlLWdh/dGEtY29uLXN1cy1n/YXRpdG9zLWVuLXVu/YS1jZXN0YS1kZS1t/aW1icmUuanBnP3M9/NjEyeDYxMiZ3PTAm/az0yMCZjPVlXVWxp/REhZdUcxZ3RZbUxP/WmVLdExQY1RPSGlx/Um1aTXJLUURJa2ot/OTg9",
    "https://imgs.search.brave.com/B3lPLrNe0jVmIL1lD_p-DaDrUGSfRWByNsrg-nXQjmM/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly90aHVt/YnMuZHJlYW1zdGlt/ZS5jb20vYi9jZXN0/YS1kZS1nYXRpdG9z/LTIwODMwODEwLmpw/Zw",
    "https://imgs.search.brave.com/4Kx8lFn13QfKMLg0nmu7tVwKGAO6fnmVqeVPX4KIhak/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMucGV4ZWxzLmNv/bS9waG90b3MvNDUx/NzAva2l0dGVucy1j/YXQtY2F0LXB1cHB5/LXJ1c2gtNDUxNzAu/anBlZz9hdXRvPWNv/bXByZXNzJmNzPXRp/bnlzcmdiJmRwcj0x/Jnc9NTAw",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("swiper", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          _swiper(SwiperLayout.STACK),
          SizedBox(height: 30),
          _swiper(SwiperLayout.TINDER),
          SizedBox(height: 30),
          _swiper(SwiperLayout.DEFAULT),
          SizedBox(height: 30),
          _swiper(SwiperLayout.CUSTOM),
        ],
      ),
    );
  }

  Widget _swiper(SwiperLayout layout) {
    return Container(
      width: double.infinity,
      height: 250,
      child: Swiper(
        layout: layout,
        viewportFraction: 0.8, // es para visualizar la imagen que sige
        scale: 0.9, // el espacio entre los contenido
        itemBuilder: (context, int index) {
          // se agrega un int al index para que recorra una lista
          return Image.network(
            // se cambio la url por la lista
            images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: images.length,
        itemWidth: 300.0,
        itemHeight: 400.0,
        pagination: SwiperPagination(),
        control: SwiperControl(),

        customLayoutOption: layout == SwiperLayout.CUSTOM
            ? (() {
                final option = CustomLayoutOption(
                  startIndex: -1,
                  stateCount: 3,
                );
                option.addRotate([-45.0 / 180, 0.0, 45.0 / 180]);
                option.addTranslate([
                  Offset(-370.0, -40.0),
                  Offset(0.0, 0.0),
                  Offset(370.0, -40.0),
                ]);
                return option;
              })()
            : null,
      ),
    );
  }
}
