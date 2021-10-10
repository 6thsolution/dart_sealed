// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hierarchy.dart';

// **************************************************************************
// Generator: sealed_generators
// **************************************************************************

/// [Apple] {
///
/// ([AppleFriend] friend){[Banana] banana} with data equality
///
/// }
@SealedManifest(_Apple)
abstract class Apple {
  const Apple._internal();

  const factory Apple.friend({
    required Banana banana,
  }) = AppleFriend;

  bool get isFriend => this is AppleFriend;

  AppleFriend get asFriend => this as AppleFriend;

  AppleFriend? get asFriendOrNull {
    final apple = this;
    return apple is AppleFriend ? apple : null;
  }

  R when<R extends Object?>({
    required R Function(Banana banana) friend,
  }) {
    final apple = this;
    if (apple is AppleFriend) {
      return friend(apple.banana);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(Banana banana)? friend,
    required R Function(Apple apple) orElse,
  }) {
    final apple = this;
    if (apple is AppleFriend) {
      return friend != null ? friend(apple.banana) : orElse(apple);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(Banana banana)? friend,
    void Function(Apple apple)? orElse,
  }) {
    final apple = this;
    if (apple is AppleFriend) {
      if (friend != null) {
        friend(apple.banana);
      } else if (orElse != null) {
        orElse(apple);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(Banana banana)? friend,
    R Function(Apple apple)? orElse,
  }) {
    final apple = this;
    if (apple is AppleFriend) {
      return friend != null ? friend(apple.banana) : orElse?.call(apple);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(AppleFriend friend) friend,
  }) {
    final apple = this;
    if (apple is AppleFriend) {
      return friend(apple);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(AppleFriend friend)? friend,
    required R Function(Apple apple) orElse,
  }) {
    final apple = this;
    if (apple is AppleFriend) {
      return friend != null ? friend(apple) : orElse(apple);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(AppleFriend friend)? friend,
    void Function(Apple apple)? orElse,
  }) {
    final apple = this;
    if (apple is AppleFriend) {
      if (friend != null) {
        friend(apple);
      } else if (orElse != null) {
        orElse(apple);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(AppleFriend friend)? friend,
    R Function(Apple apple)? orElse,
  }) {
    final apple = this;
    if (apple is AppleFriend) {
      return friend != null ? friend(apple) : orElse?.call(apple);
    } else {
      throw AssertionError();
    }
  }
}

/// (([AppleFriend] : [Apple]) friend){[Banana] banana}
///
/// with data equality
class AppleFriend extends Apple with EquatableMixin {
  const AppleFriend({
    required this.banana,
  }) : super._internal();

  final Banana banana;

  @override
  String toString() => 'Apple.friend(banana: $banana)';

  @override
  List<Object?> get props => [
        banana,
      ];
}

/// [Banana] {
///
/// ([BananaFriend] friend){[Apple] apple} with data equality
///
/// }
@SealedManifest(_Banana)
abstract class Banana {
  const Banana._internal();

  const factory Banana.friend({
    required Apple apple,
  }) = BananaFriend;

  bool get isFriend => this is BananaFriend;

  BananaFriend get asFriend => this as BananaFriend;

  BananaFriend? get asFriendOrNull {
    final banana = this;
    return banana is BananaFriend ? banana : null;
  }

  R when<R extends Object?>({
    required R Function(Apple apple) friend,
  }) {
    final banana = this;
    if (banana is BananaFriend) {
      return friend(banana.apple);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(Apple apple)? friend,
    required R Function(Banana banana) orElse,
  }) {
    final banana = this;
    if (banana is BananaFriend) {
      return friend != null ? friend(banana.apple) : orElse(banana);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(Apple apple)? friend,
    void Function(Banana banana)? orElse,
  }) {
    final banana = this;
    if (banana is BananaFriend) {
      if (friend != null) {
        friend(banana.apple);
      } else if (orElse != null) {
        orElse(banana);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(Apple apple)? friend,
    R Function(Banana banana)? orElse,
  }) {
    final banana = this;
    if (banana is BananaFriend) {
      return friend != null ? friend(banana.apple) : orElse?.call(banana);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(BananaFriend friend) friend,
  }) {
    final banana = this;
    if (banana is BananaFriend) {
      return friend(banana);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(BananaFriend friend)? friend,
    required R Function(Banana banana) orElse,
  }) {
    final banana = this;
    if (banana is BananaFriend) {
      return friend != null ? friend(banana) : orElse(banana);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(BananaFriend friend)? friend,
    void Function(Banana banana)? orElse,
  }) {
    final banana = this;
    if (banana is BananaFriend) {
      if (friend != null) {
        friend(banana);
      } else if (orElse != null) {
        orElse(banana);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(BananaFriend friend)? friend,
    R Function(Banana banana)? orElse,
  }) {
    final banana = this;
    if (banana is BananaFriend) {
      return friend != null ? friend(banana) : orElse?.call(banana);
    } else {
      throw AssertionError();
    }
  }
}

/// (([BananaFriend] : [Banana]) friend){[Apple] apple}
///
/// with data equality
class BananaFriend extends Banana with EquatableMixin {
  const BananaFriend({
    required this.apple,
  }) : super._internal();

  final Apple apple;

  @override
  String toString() => 'Banana.friend(apple: $apple)';

  @override
  List<Object?> get props => [
        apple,
      ];
}

/// [Basket] {
///
/// ([BasketFriends] friends){[Apple]? apple, [Banana]? banana} with data equality
///
/// }
@SealedManifest(_Basket)
abstract class Basket {
  const Basket._internal();

  const factory Basket.friends({
    Apple? apple,
    Banana? banana,
  }) = BasketFriends;

  bool get isFriends => this is BasketFriends;

  BasketFriends get asFriends => this as BasketFriends;

  BasketFriends? get asFriendsOrNull {
    final basket = this;
    return basket is BasketFriends ? basket : null;
  }

  R when<R extends Object?>({
    required R Function(Apple? apple, Banana? banana) friends,
  }) {
    final basket = this;
    if (basket is BasketFriends) {
      return friends(basket.apple, basket.banana);
    } else {
      throw AssertionError();
    }
  }

  R maybeWhen<R extends Object?>({
    R Function(Apple? apple, Banana? banana)? friends,
    required R Function(Basket basket) orElse,
  }) {
    final basket = this;
    if (basket is BasketFriends) {
      return friends != null
          ? friends(basket.apple, basket.banana)
          : orElse(basket);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `whenOrNull` instead. Will be removed by next release.')
  void partialWhen({
    void Function(Apple? apple, Banana? banana)? friends,
    void Function(Basket basket)? orElse,
  }) {
    final basket = this;
    if (basket is BasketFriends) {
      if (friends != null) {
        friends(basket.apple, basket.banana);
      } else if (orElse != null) {
        orElse(basket);
      }
    } else {
      throw AssertionError();
    }
  }

  R? whenOrNull<R extends Object?>({
    R Function(Apple? apple, Banana? banana)? friends,
    R Function(Basket basket)? orElse,
  }) {
    final basket = this;
    if (basket is BasketFriends) {
      return friends != null
          ? friends(basket.apple, basket.banana)
          : orElse?.call(basket);
    } else {
      throw AssertionError();
    }
  }

  R map<R extends Object?>({
    required R Function(BasketFriends friends) friends,
  }) {
    final basket = this;
    if (basket is BasketFriends) {
      return friends(basket);
    } else {
      throw AssertionError();
    }
  }

  R maybeMap<R extends Object?>({
    R Function(BasketFriends friends)? friends,
    required R Function(Basket basket) orElse,
  }) {
    final basket = this;
    if (basket is BasketFriends) {
      return friends != null ? friends(basket) : orElse(basket);
    } else {
      throw AssertionError();
    }
  }

  @Deprecated('Use `mapOrNull` instead. Will be removed by next release.')
  void partialMap({
    void Function(BasketFriends friends)? friends,
    void Function(Basket basket)? orElse,
  }) {
    final basket = this;
    if (basket is BasketFriends) {
      if (friends != null) {
        friends(basket);
      } else if (orElse != null) {
        orElse(basket);
      }
    } else {
      throw AssertionError();
    }
  }

  R? mapOrNull<R extends Object?>({
    R Function(BasketFriends friends)? friends,
    R Function(Basket basket)? orElse,
  }) {
    final basket = this;
    if (basket is BasketFriends) {
      return friends != null ? friends(basket) : orElse?.call(basket);
    } else {
      throw AssertionError();
    }
  }
}

/// (([BasketFriends] : [Basket]) friends){[Apple]? apple, [Banana]? banana}
///
/// with data equality
class BasketFriends extends Basket with EquatableMixin {
  const BasketFriends({
    this.apple,
    this.banana,
  }) : super._internal();

  final Apple? apple;
  final Banana? banana;

  @override
  String toString() => 'Basket.friends(apple: $apple, banana: $banana)';

  @override
  List<Object?> get props => [
        apple,
        banana,
      ];
}
