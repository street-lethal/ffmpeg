# ffmpeg

## 初期化

```sh
./scripts/init.sh
```

## wav -> flac

対象ファイル(*.wav)を `wav/` に配置

```sh
./scripts/wav2flac.sh
```

## wav -> mp3

対象ファイル(*.wav)を `wav/` に配置

```sh
./scripts/wav2mp3.sh
```

## MP3 にタグ付け

対象ファイル(*.mp3)を `mp3/` に配置

```sh
vi .env # ARTIST, ALBUM, GENRE を編集
```

```sh
./scripts/tag_mp3.sh
```

`mp3/tagged/` に生成される
