import 'package:flutter/material.dart';

class SelectFilter extends StatefulWidget {
  @override
  _SelectFilterState createState() => _SelectFilterState();
}

class _SelectFilterState extends State<SelectFilter> {
  bool isFeatureSelected = false;
  bool isHighToLowSelected = false;
  bool isLowToHighSelected = false;
  bool isAvgReviewSelected = false;
  bool isNewArrivalSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(7.0),
          topLeft: Radius.circular(7.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: ListTile(
                  title: Text(
                    'Featured',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  leading: Checkbox(
                      value: isFeatureSelected,
                      onChanged: (value) {
                        setState(() {
                          isFeatureSelected = value;
                        });
                      }),
                ),
              ),
              Container(
                child: ListTile(
                  title: Text(
                    'Price: Low to High',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  leading: Checkbox(
                      value: isLowToHighSelected,
                      onChanged: (value) {
                        setState(() {
                          isLowToHighSelected = value;
                        });
                      }),
                ),
              ),
              Container(
                child: ListTile(
                  title: Text(
                    'Price: High to Low',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  leading: Checkbox(
                      value: isHighToLowSelected,
                      onChanged: (value) {
                        setState(() {
                          isHighToLowSelected = value;
                        });
                      }),
                ),
              ),
              Container(
                child: ListTile(
                  title: Text(
                    'Avg. Customer Review',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  leading: Checkbox(
                      value: isAvgReviewSelected,
                      onChanged: (value) {
                        setState(() {
                          isAvgReviewSelected = value;
                        });
                      }),
                ),
              ),
              Container(
                child: ListTile(
                  title: Text(
                    'Newest Arrivals',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  leading: Checkbox(
                      value: isNewArrivalSelected,
                      onChanged: (value) {
                        setState(() {
                          isNewArrivalSelected = value;
                        });
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
