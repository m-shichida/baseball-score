# ポジション
Position.create(name: 'ピッチャー', name_kanji: '投手', name_short: '(投)')
Position.create(name: 'キャッチャー', name_kanji: '捕手', name_short: '(捕)')
Position.create(name: 'ファースト', name_kanji: '一塁手', name_short: '(一)')
Position.create(name: 'セカンド', name_kanji: '二塁手', name_short: '(二)')
Position.create(name: 'サード', name_kanji: '三塁手', name_short: '(三)')
Position.create(name: 'ショート', name_kanji: '遊撃手', name_short: '(遊)')
Position.create(name: 'レフト', name_kanji: '左翼手', name_short: '(左)')
Position.create(name: 'センター', name_kanji: '中堅手', name_short: '(中)')
Position.create(name: 'ライト', name_kanji: '右翼手', name_short: '(右)')

# 開発環境下のでのメインチーム
if Rails.env.development?
  main_team = Team.create(name: '埼玉西武ライオンズ', base: true)
  Team.create(name: '東北楽天ゴールデンイーグルス')
  Team.create(name: '北海道日本ハムファイターズ')
  Team.create(name: '千葉ロッテマリーンズ')
  Team.create(name: '福岡ソフトバンクホークス')
  Team.create(name: 'オリックス・バファローズ')

  main_team.players.create(last_name: '源田', first_name: '壮亮', number: 6)
  main_team.players.create(last_name: '外崎', first_name: '修汰', number: 5)
  main_team.players.create(last_name: '鈴木', first_name: '将平', number: 46)
  main_team.players.create(last_name: '山川', first_name: '穂高', number: 33)
  main_team.players.create(last_name: '森', first_name: '友哉', number: 10)
  main_team.players.create(last_name: '中村', first_name: '剛也', number: 60)
  main_team.players.create(last_name: '栗山', first_name: '巧', number: 1)
  main_team.players.create(last_name: '木村', first_name: '文紀', number: 9)
  main_team.players.create(last_name: '今井', first_name: '達也', number: 11)
else
  Team.create(name: 'ECLEA', base: true)
end
