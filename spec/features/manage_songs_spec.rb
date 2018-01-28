require 'rails_helper'

feature 'Manage songs', js: true do
  let(:current_artist) { create :artist }
  scenario 'add a new song' do
    # Point your browser towards the todo path
    visit artist_path(current_artist)

    # Enter description in the text field
    type_text "Best song"

    # Press enter (to submit the form)
    invoke_action

    # Expect the new song to be displayed in the list of songs
    expect(page).to have_content('Best song')
  end
  scenario 'remove a song' do
    # Point your browser towards the todo path
    visit artist_path(current_artist)

    # Enter description in the text field
    type_text "Best song"

    # Press enter (to submit the form)
    invoke_action
    click_on("Delete song")

    # Expect the new song to be displayed in the list of songs
    expect(page).to have_no_content('Best song')
  end

end

def invoke_action
  page.execute_script("$('form').submit()")
end

def type_text input
  fill_in 'song_name', with: input
end
