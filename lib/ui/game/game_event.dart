import "package:flutter/material.dart";

@immutable
abstract class GameEvent {}

class GameNewGameEvent extends GameEvent {
}

class GameGetUserUidEvent extends GameEvent {
  final String? uid;

  GameGetUserUidEvent(this.uid);
}