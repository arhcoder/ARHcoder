import 'package:flutter/material.dart';
import 'package:arhcoder/Responsive/Responsive.dart';

import 'package:arhcoder/Widgets/titular.dart';

class Panel extends StatelessWidget
{
    final String title;
    final double cardHeight;
    final bool largeCards;

    final List <Widget> cards;

    Panel({Key, key, this.title, this.cardHeight, this.largeCards, this.cards});

    @override
    Widget build(BuildContext context)
    {
        // Medidas de la pantalla //
        double deviceWidth = MediaQuery.of(context).size.width;

        // Botones de navegación a los costados //
        bool desktop;
        bool tablet;
        bool mobile;

        // Desktop //
        if(deviceWidth > Responsive.landscapeBreakpoint)
        {
            desktop = true;
            tablet = false;
            mobile = false;
        }
        // Tablet //
        else if(deviceWidth <= Responsive.landscapeBreakpoint
        && deviceWidth > Responsive.portraitBreakpoint)
        {
            tablet = true;
            desktop = false;
            mobile = false;
        }
        // Mobile //
        else if(deviceWidth <= Responsive.portraitBreakpoint)
        {
            mobile = true;
            desktop = false;
            tablet = false;
        }

        int columns = desktop ? 2 : 1;

        double cardsHorizontalMargin =
        desktop || tablet ? Constants.blockNavigationButtonSpace
        : Constants.padding;
        
        return Container
        (
            child: Column
            (
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children:
                [
                    // Titular //
                    Container
                    (
                        width:
                        desktop ? Constants.webBlockWidth - (Constants.blockNavigationButtonSpace * 2):
                        tablet ? deviceWidth * 0.90 - (Constants.blockNavigationButtonSpace * 2):
                        deviceWidth * 0.90,

                        child: Titular(title: this.title)
                    ),
                    
                    SizedBox(height: Constants.marginInterior),
                    Expanded
                    (
                        child: Container
                        (
                            width: Constants.webBlockWidth,
                            child: GridView
                            (
                                padding: EdgeInsets.only(
                                    left: cardsHorizontalMargin,
                                    right: cardsHorizontalMargin,
                                    bottom: Constants.padding * 1.5,
                                ),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                                (
                                    crossAxisCount: largeCards? 1: columns,
                                    mainAxisExtent: this.cardHeight,
                                    crossAxisSpacing: Constants.marginInterior,
                                    mainAxisSpacing: Constants.marginInterior
                                ),
                                children: cards
                            )
                        )
                    )
                ]
            )
        );
    }
}