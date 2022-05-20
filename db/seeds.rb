
first_user = User.create(name: 'Tom', photo: 'https://www.shareicon.net/data/512x512/2015/09/18/103160_man_512x512.png', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://w7.pngwing.com/pngs/193/660/png-transparent-computer-icons-woman-avatar-avatar-girl.png', bio: 'Teacher from Poland.')

first_post = Post.create(user: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(user: first_user, title: 'Hello', text: 'This is my second post')
third_post = Post.create(user: first_user, title: 'Hello', text: 'This is my third post')
forth_post = Post.create(user: first_user, title: 'Hello', text: 'This is my forth post')
fifth_post = Post.create(user: first_user, title: 'Hello', text: 'This is my fifth post')
sixth_post = Post.create(user: first_user, title: 'Hello', text: 'This is my sixth post')

Comment.create(post: first_post, user: second_user, text: 'Hi Ayman!' )
Comment.create(post: first_post, user: second_user, text: 'Hi Farouq!' )
Comment.create(post: first_post, user: second_user, text: 'Hi Ali!' )
Comment.create(post: first_post, user: second_user, text: 'Hi Ahd!' )

