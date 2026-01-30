import Foundation

struct DeckLibrary {
    static let decks: [Deck] = [
        Deck(id: "theme1_1", name: "Theme 1.1 Valores tradicionales y modernos", cards: [
            CardItem(spanish: "el hogar", english: "home/household"),
            CardItem(spanish: "la convivencia", english: "living together/coexistence"),
            CardItem(spanish: "la responsabilidad", english: "responsibility"),
            CardItem(spanish: "el compromiso", english: "commitment"),
            CardItem(spanish: "la independencia", english: "independence"),
            CardItem(spanish: "la presión social", english: "social pressure"),
            CardItem(spanish: "conciliar (trabajo y vida)", english: "to balance (work and life)"),
            CardItem(spanish: "llevar una vida sana", english: "to lead a healthy life"),
            CardItem(spanish: "tener expectativas", english: "to have expectations"),
            CardItem(spanish: "cuestionar", english: "to question/challenge"),
            CardItem(spanish: "fomentar", english: "to promote/encourage"),
            CardItem(spanish: "cambiar de mentalidad", english: "to change one’s mindset")
        ]),
        Deck(id: "theme1_2", name: "Theme 1.2 Igualdad de género", cards: [
            CardItem(spanish: "la brecha salarial", english: "gender pay gap"),
            CardItem(spanish: "el techo de cristal", english: "glass ceiling"),
            CardItem(spanish: "el machismo", english: "sexism/machismo"),
            CardItem(spanish: "la corresponsabilidad", english: "shared responsibility"),
            CardItem(spanish: "la conciliación", english: "work-life balance"),
            CardItem(spanish: "el permiso de paternidad", english: "paternity leave"),
            CardItem(spanish: "la violencia de género", english: "gender-based violence"),
            CardItem(spanish: "denunciar", english: "to report/to denounce"),
            CardItem(spanish: "empoderar", english: "to empower"),
            CardItem(spanish: "estereotipos", english: "stereotypes"),
            CardItem(spanish: "igualdad de oportunidades", english: "equal opportunities"),
            CardItem(spanish: "repartir las tareas", english: "to share chores")
        ]),
        Deck(id: "theme1_3", name: "Theme 1.3 Ídolos e influencers", cards: [
            CardItem(spanish: "un referente", english: "role model"),
            CardItem(spanish: "las redes sociales", english: "social media"),
            CardItem(spanish: "la fama", english: "fame"),
            CardItem(spanish: "la presión mediática", english: "media pressure"),
            CardItem(spanish: "seguidores", english: "followers"),
            CardItem(spanish: "contenido", english: "content"),
            CardItem(spanish: "patrocinio", english: "sponsorship"),
            CardItem(spanish: "la autoestima", english: "self-esteem"),
            CardItem(spanish: "perjudicial", english: "harmful"),
            CardItem(spanish: "engancharse a", english: "to get hooked on"),
            CardItem(spanish: "compararse con", english: "to compare oneself to"),
            CardItem(spanish: "promover hábitos", english: "to promote habits")
        ]),
        Deck(id: "theme2_2", name: "Theme 2.2 Medios, TV y cultura popular", cards: [
            CardItem(spanish: "la televisión pública", english: "public television"),
            CardItem(spanish: "un reality show", english: "reality TV show"),
            CardItem(spanish: "una plataforma de streaming", english: "streaming platform"),
            CardItem(spanish: "la audiencia", english: "audience/viewership"),
            CardItem(spanish: "la programación", english: "TV schedule/programming"),
            CardItem(spanish: "el sensacionalismo", english: "sensationalism"),
            CardItem(spanish: "la publicidad", english: "advertising"),
            CardItem(spanish: "un informativo", english: "news programme"),
            CardItem(spanish: "estar al día", english: "to be up to date"),
            CardItem(spanish: "manipular", english: "to manipulate"),
            CardItem(spanish: "el sesgo", english: "bias"),
            CardItem(spanish: "la cobertura mediática", english: "media coverage")
        ]),
        Deck(id: "theme2_3", name: "Theme 2.3 Inmigración", cards: [
            CardItem(spanish: "la inmigración", english: "immigration"),
            CardItem(spanish: "el/la inmigrante", english: "immigrant"),
            CardItem(spanish: "el asilo", english: "asylum"),
            CardItem(spanish: "un refugiado", english: "refugee"),
            CardItem(spanish: "regularizar", english: "to regularise (legal status)"),
            CardItem(spanish: "integración", english: "integration"),
            CardItem(spanish: "la discriminación", english: "discrimination"),
            CardItem(spanish: "aportar", english: "to contribute"),
            CardItem(spanish: "cubrir vacantes", english: "to fill vacancies"),
            CardItem(spanish: "la mano de obra", english: "workforce/labour"),
            CardItem(spanish: "la vivienda", english: "housing"),
            CardItem(spanish: "acceso a servicios", english: "access to services")
        ]),
        Deck(id: "higher_level", name: "Higher level language", cards: [
            CardItem(spanish: "desde mi punto de vista", english: "from my point of view"),
            CardItem(spanish: "no cabe duda de que", english: "there’s no doubt that"),
            CardItem(spanish: "a largo plazo", english: "in the long term"),
            CardItem(spanish: "por un lado… por otro", english: "on the one hand… on the other"),
            CardItem(spanish: "cabe destacar que", english: "it’s worth highlighting that"),
            CardItem(spanish: "sin embargo", english: "however"),
            CardItem(spanish: "aun así", english: "even so"),
            CardItem(spanish: "de hecho", english: "in fact"),
            CardItem(spanish: "a pesar de", english: "despite"),
            CardItem(spanish: "merece la pena", english: "it’s worth it"),
            CardItem(spanish: "plantear", english: "to raise/pose (an issue)"),
            CardItem(spanish: "abordar", english: "to address/tackle")
        ])
    ]
}
