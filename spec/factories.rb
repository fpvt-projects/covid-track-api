FactoryBot.define do
    factory :account do
        email {"tester@gmail.com"}
        password {"qwer1234"}
    end

    factory :account2 do
        email {"tester@gmail.com"}
        password {"qwer1234"}
    end

    factory :user do
        lastname {"Test"}
        firstname {"User"}
        middlename {"Rspec"}
        address {"123 st, 321 brgy"}
        region {"Region_I"}
        cellnumber {"09188875555"}
        birthdate {Date.parse("January, 16, 1990")}
        gender {"Male"}
        account_id {1}
    end

    factory :user2 do
        lastname {"Test"}
        firstname {"User"}
        middlename {"Rspec"}
        address {"123 st, 321 brgy"}
        region {"Region_I"}
        cellnumber {"09188875565"}
        birthdate {Date.parse("January, 16, 1990")}
        gender {"Male"}
        account_id {1}
    end

end