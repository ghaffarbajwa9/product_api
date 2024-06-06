class User < ApplicationRecord
    role enum: {admin: 0, developer: 1, qa: 2, salesman: 3, quest: 4}
end
