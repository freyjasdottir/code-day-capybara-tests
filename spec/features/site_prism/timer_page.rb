class ModalSection < SitePrism::Section
  element :title, '.modal-title'
  element :duration, '#timeEntryDuration'
  element :select_project, '#timeEntryProject'
  element :select_task, '#timeEntryTask'
  element :description, '#timeEntryName'
  element :create_btn, '#createEntryBtn'
  element :update_btn, '#updateEntryBtn'
  element :delete_btn, '#deleteEntryBtn'
end

class TimerPage < SitePrism::Page
  set_url '/timer'
  set_url_matcher %r{/timer}

  element :header, '#pageHeader'
  element :new_timer_btn, '#newEntryBtn'
  element :stop_btn, '.te_stop_btn'
  elements :start_btns, '.te_start_btn'
  elements :edit_btns, '.te_edit_btn'

  section :modal, ModalSection, '.modal'
end