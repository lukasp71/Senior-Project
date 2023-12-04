import 'package:flutter/material.dart';
import 'package:senior_project/news_section/constants/constants.dart';

class NewsCard extends StatelessWidget {
  final String imgUrl, title, desc, content, postUrl;

  const NewsCard({
    Key? key,
    required this.imgUrl,
    required this.desc,
    required this.title,
    required this.content,
    required this.postUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Card(
        elevation: Sizes.dimen_4,
        margin: const EdgeInsets.fromLTRB(
            Sizes.dimen_16, 0, Sizes.dimen_16, Sizes.dimen_16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              imgUrl.isNotEmpty
                  ? Image.network(
                      imgUrl,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    )
                  : const SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Icon(Icons.image_not_supported_outlined),
                    ),
              vertical15,
              Padding(
                padding: const EdgeInsets.all(Sizes.dimen_6),
                child: Text(
                  title,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Sizes.dimen_6),
                child: Text(
                  desc,
                  maxLines: 3,
                  style: const TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
