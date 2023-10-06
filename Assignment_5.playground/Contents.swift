//1. შექმენით enum-ი სახელით DayOfWeek შესაბამისი ქეისებით. დაწერეთ function რომელიც იღებს ამ ენამის ტიპს. function-მა უნდა და-print-ოს, გადაწოდებული დღე კვირის დღეა თუ დასვენების.


enum DayOfWeek: String {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

func checkWeekdays (day: DayOfWeek) {
    if day == .saturday || day == .sunday {
        print("It's weekend")
    } else {
        print("It's weekday")
    }
}

checkWeekdays(day: .friday)


//2. შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.


enum Weather {
    case sunny (Celsius: Float)
    case cloudy (Celsius: Float)
    case rainy (Celsius: Float)
    case snowy (Celsius: Float)
}

func outfitRecommendations (weather: Weather) {
    switch weather {
    case .sunny(Celsius: let Celsius):
        if Celsius > 18.5 {
            print("It's warm and sunny outside, wear summer clothes and don't forget sunscreen ")
        } else {
            print("It's sunny but still cold, wear something warm but sunscreen is still a must")
        }
    case .cloudy(Celsius: let Celsius):
        if Celsius > 15 {
            print("It's kinda warm but cloudy outside, don't forget the jacket ")
        } else {
            print("It's cloudy and cold weather, wear something warm")
        }
    case .rainy(Celsius: let Celsius):
        if Celsius > 15 {
            print("It's kinda warm but rainy outside, don't forget the umbrella ")
        } else {
            print("It's rainy and cold weather, wear raincoat and something warm")
        }
    case .snowy(Celsius: let Celsius):
        if Celsius > 10 {
            print("It's not that cold, but still wear thick winter clothes and gloves")
        } else {
            print("It's freezing cold outside, if I were you, I would't go out")
        }
    }
}

outfitRecommendations(weather: .snowy(Celsius: -5))


//3. შექმენით struct-ი Book, with properties როგორიცაა: title, author, publicationYear. ამის შემდეგ შექმენით array-ი Book-ის ტიპის, შექმენით რამოდენიმე Book-ის ობიექტი, და შეავსეთ array ამ წიგნებით. დაწერეთ function რომელიც მიიღებს ამ წიგნების array-ს და მიიღებს წელს. function-მა უნდა დაგვიბრუნოს ყველა წიგნი რომელიც გამოშვებულია ამ წლის შემდეგ. დავ-print-ოთ ეს წიგნები.


struct Book {
    var title: String
    var author: String
    var publicationYear: Int
    
    init (title: String, author: String, publicationYear: Int) {
        self.title = title
        self.author = author
        self.publicationYear = publicationYear
    }
}

let jackLondon = Book(title: "Martin Eden", author: "Jack London", publicationYear: 1909)
let bulgakov = Book(title: "The Master and Margarita", author: "Mikhail Bulgakov", publicationYear: 1967)
let bloch = Book(title: "Psycho", author: "Robert Block", publicationYear: 1959)
let burgess = Book(title: "A Clockwork Orange", author: "Anthony Burgess", publicationYear: 1962)

let booksArray = [jackLondon, bulgakov, bloch, burgess]

func bookFilter (array: [Book], year: Int) -> [Book] {
    var tempArray: [Book] = []
    for book in array {
        if book.publicationYear > year {
            tempArray.append(book)
        }
    }
    return tempArray
}

var filteredBooks = bookFilter(array: booksArray, year: 1950)

for book in filteredBooks {
    print(book)
}



//4. შექმენით struct BankAccount, with properties როგორიცაა: holderName, accountNumber, balance. ამ ობიექტში დაამატეთ methods, დეპოზიტისა და გატანის (withdraw), დაწერეთ შესაბამისი ლოგიკა და ეცადეთ გაითვალისწინოთ სხვადასხვა ეჯ-ქეისები (edge case). მაგ. თანხის გატანისას თუ თანხა იმაზე ნაკლებია ვიდრე გვაქვს, თანხას ვერ გავიტანთ და ასე შემდეგ. print-ის მეშვეობით გამოვიტანოთ შესაბამისი შეცდომები . ამის შემდეგ შექმენით BankAccount ობიექტი და გააკეთეთ ტრანზაქციების იმიტაცია თქვენს მიერ დაწერილი მეთოდებით.


struct BankAccount {
    var holderName: String
    var accountNumber: Int
    var balance: Float
    
    init(holderName: String, accountNumber: Int, balance: Float) {
        self.holderName = holderName
        self.accountNumber = accountNumber
        self.balance = balance
    }
    
    mutating func addDeposit(amount: Float) {
        balance += amount
        print("Operation was successful, current balance is \(balance)")
    }
    
    mutating func withdraw(amount: Float) {
        if amount > balance {
            print("There is not enough balance, please withdraw less than \(balance)")
        } else {
            balance -= amount
            print("Operation was successful, remaining balance is \(balance)")
        }
    }
}

var account = BankAccount(holderName: "Not so rich Bruce Wayne", accountNumber: 002034500842, balance: 3650.7)

account.withdraw(amount: 4000)
account.addDeposit(amount: 5788)
account.withdraw(amount: 7000)


//5. შექმენით enum-ი Genre მუსიკის ჟანრის ქეისებით. ამის შემდეგ შექმენით struct Song, with properties: title, artist, duration, genre, description (computied propertie უნდა იყოს description) და publisher (lazy propertie-ად შექმენით publisher). შემდეგ შექმენით თქვენი playlist array რომელსაც Song-ებით შეავსებთ (ზოგ song-ს ჰქონდეს publisher, ზოგს არა). შექმენით function რომელსაც გადააწვდით თქვენს playlist-ს და ჟანრს, function-ს დააბრუნებინეთ მხოლოდ იმ Song-ების array, რომელიც ამ ჟანრის იქნება და შემდეგ დაა-print-ინეთ ეს Song-ები.


enum Genre {
    case hardRock
    case heavyMetal
    case metal
    case classicRock
    case indie
}

struct Song {
    var title: String
    var artist: String
    var duration: Float
    var genre: Genre
    var description: String {
        return "the song is called " + title + " by " + artist + " duration is: " + "\(duration)"
        + " minutes. Genre: " + "\(genre) "
    }
    lazy var publisher: String? = nil
    
}

let ironMaiden = Song(title: "Dance of Death", artist: "Iron Maiden", duration: 8.37, genre: .heavyMetal, publisher: "Kevin Shirley")
let architects = Song(title: "Broken Cross", artist: "Architects", duration: 3.52, genre: .metal)
let muse = Song(title: "Unintended", artist: "Muse", duration: 3.57, genre: .classicRock)
let queen = Song(title: "Killer Queen", artist: "Queen", duration: 3.00, genre: .classicRock, publisher: "Roy Thomas Baker")

var myPlaylist: [Song] = [ironMaiden, architects, muse, queen]

func filterMusic(playlist: [Song], genre: Genre) -> [Song] {
    var filteredArray: [Song] = []
    for song in playlist {
        if song.genre == genre {
            filteredArray.append(song)
        }
    }
    
    for i in filteredArray {
        var song = i
        print(song.description + (song.publisher ?? ""))
    }
    return filteredArray
}

filterMusic(playlist: myPlaylist, genre: .classicRock)
