import 'package:flutter/material.dart';


enum CustomBannerReasonClosed{
  dismiss,
  swipe,
  hide,
  remove,
}

class CustomBanner extends StatefulWidget {
  
  const CustomBanner({
    Key? key,
    required this.content,
    this.contentTextStyle,
    this.elevation,
    this.leading,
    this.backgroundColor,
    this.padding,
    this.leadingPadding,
    this.forceActionsBelow = false,
    this.overflowAlignment = OverflowBarAlignment.end,
    this.animation,
    this.onVisible
  }) : assert(elevation == null || elevation >= 0.0),
     
       super(key: key);

  final Widget content;

  final TextStyle? contentTextStyle;

  final double? elevation;
  final Widget? leading;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? leadingPadding;
  final bool forceActionsBelow;

  final OverflowBarAlignment overflowAlignment;
   final Animation<double>? animation;
  final VoidCallback? onVisible;
  static AnimationController createAnimationController({ required TickerProvider vsync }) {
    return AnimationController(
      duration:const Duration(milliseconds: 400),
      debugLabel: 'CustomBanner',
      vsync: vsync,
    );
  }

  CustomBanner withAnimation(Animation<double> newAnimation, { Key? fallbackKey }) {
    return CustomBanner(
      key: key ?? fallbackKey,
      content: content,
      contentTextStyle: contentTextStyle,
     
      elevation: elevation,
      leading: leading,
      backgroundColor: backgroundColor,
      padding: padding,
      leadingPadding: leadingPadding,
      forceActionsBelow: forceActionsBelow,
      overflowAlignment: overflowAlignment,
      animation: newAnimation,
      onVisible: onVisible,
    );
  }

  @override
  State<CustomBanner> createState() => _CustomBannerState();
}

class _CustomBannerState extends State<CustomBanner> {
  bool _wasVisible = false;

  @override
  void initState() {
    super.initState();
    widget.animation?.addStatusListener(_onAnimationStatusChanged);
  }

  @override
  void didUpdateWidget(CustomBanner oldWidget) {
    if (widget.animation != oldWidget.animation) {
      oldWidget.animation?.removeStatusListener(_onAnimationStatusChanged);
      widget.animation?.addStatusListener(_onAnimationStatusChanged);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    widget.animation?.removeStatusListener(_onAnimationStatusChanged);
    super.dispose();
  }

  void _onAnimationStatusChanged(AnimationStatus animationStatus) {
    switch (animationStatus) {
      case AnimationStatus.dismissed:
      case AnimationStatus.forward:
      case AnimationStatus.reverse:
        break;
      case AnimationStatus.completed:
        if (widget.onVisible != null && !_wasVisible) {
          widget.onVisible!();
        }
        _wasVisible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    final ThemeData theme = Theme.of(context);
    

    final EdgeInsetsGeometry padding = widget.padding ?? const EdgeInsets.only(left: 10);
    final EdgeInsetsGeometry leadingPadding = widget.leadingPadding
        ?? const EdgeInsets.only(left: 10);

    final Widget buttonBar = Container(
      alignment: AlignmentDirectional.centerEnd,
      constraints: const BoxConstraints(minHeight: 52.0),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: OverflowBar(
        overflowAlignment: widget.overflowAlignment,
        spacing: 8,
       
      ),
    );

    final double elevation = widget.elevation ??  0.0;
    final Color backgroundColor = widget.backgroundColor
        ?? Colors.red
       ;
    final TextStyle? textStyle = widget.contentTextStyle
       
        ?? theme.textTheme.bodyText2;

    Widget CustomBanner = Container(
      margin: EdgeInsets.only(bottom: elevation > 0 ? 10.0 : 0.0),
      child: Material(
        elevation: elevation,
        color: backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: padding,
              child: Row(
                children: <Widget>[
                  if (widget.leading != null)
                    Padding(
                      padding: leadingPadding,
                      child: widget.leading,
                    ),
                  Expanded(
                    child: DefaultTextStyle(
                      style: textStyle!,
                      child: widget.content,
                    ),
                  ),
                
                ],
              ),
            ),
           

            if (elevation == 0)
              const Divider(height: 0),
          ],
        ),
      ),
    );

    // This provides a static banner for backwards compatibility.
    if (widget.animation == null)
      return CustomBanner;

    CustomBanner = SafeArea(
      child: CustomBanner,
    );

    final CurvedAnimation heightAnimation = CurvedAnimation(parent: widget.animation!, curve: Curves.easeInOut);
    final Animation<Offset> slideOutAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: widget.animation!,
      curve: const Threshold(0.0),
    ));

    CustomBanner = Semantics(
      container: true,
      liveRegion: true,
      onDismiss: () {
       // ScaffoldMessenger.of(context).removeCurrentCustomBanner(reason: CustomBannerClosedReason.dismiss);
      },
      child: mediaQueryData.accessibleNavigation
          ? CustomBanner
          : SlideTransition(
        position: slideOutAnimation,
        child: CustomBanner,
      ),
    );

    final Widget CustomBannerTransition;
    if (mediaQueryData.accessibleNavigation) {
      CustomBannerTransition = CustomBanner;
    } else {
      CustomBannerTransition = AnimatedBuilder(
        animation: heightAnimation,
        builder: (BuildContext context, Widget? child) {
          return Align(
            alignment: AlignmentDirectional.bottomStart,
            heightFactor: heightAnimation.value,
            child: child,
          );
        },
        child: CustomBanner,
      );
    }

    return Hero(
      tag: '<CustomBanner Hero tag - ${widget.content}>',
      child: ClipRect(child: CustomBannerTransition),
    );
  }
}
