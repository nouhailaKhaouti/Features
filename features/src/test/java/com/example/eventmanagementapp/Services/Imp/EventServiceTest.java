package com.example.eventmanagementapp.Services.Imp;

import static org.junit.Assert.*;
import static org.mockito.Mockito.*;
import static org.junit.Assert.assertEquals;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Date;
import java.sql.Time;
import java.util.List;
import java.util.Optional;

import com.example.eventmanagementapp.Domain.Enums.BilletType;
import org.junit.Before;
import org.junit.Test;

import com.example.eventmanagementapp.Domain.*;
import com.example.eventmanagementapp.Repositories.Imp.EventRepository;

public class EventServiceTest {

    private EventService eventService;
    private EventRepository eventRepository;
    private UserService userService;
    private CategoryService categoryService;
    private BilletService billetService;

    @Before
    public void setUp() {
        eventRepository = mock(EventRepository.class);
        userService = mock(UserService.class);
        categoryService = mock(CategoryService.class);
        billetService = mock(BilletService.class);
        eventService = new EventService(eventRepository);
        eventService.setUserRepositoryI(userService);
        eventService.setCategoryRepositoryI(categoryService);
        eventService.setBilletService(billetService);
    }

    /*Insert new event function testing*/
    @Test
    public void testSaveEventWhenValidThenSuccess() throws SQLException {
        Event event = createValidEvent();
        UserE user = createValidUser();
        Category category = createValidCategory();
        Billet billet = createValidBillet();

        when(userService.findByEmail(anyString())).thenReturn(new ResponseEntity("successfully retrieved the user", 200, user));
        when(categoryService.findById(anyLong())).thenReturn(Optional.of(category));
        when(eventRepository.save(event)).thenReturn(true);

        ResponseEntity response = eventService.save(event, List.of(billet));

        assertEquals("your event has been successfully added", 200L, (long) response.getCode());

        verify(billetService, times(1)).save(billet);
    }

    @Test
    public void testSaveEventWhenNullEventThen404() throws SQLException {
        ResponseEntity response = eventService.save(null, List.of(createValidBillet()));

        assertEquals("the event your trying to insert is null",404L,(long) response.getCode());
    }

    @Test
    public void testSaveEventWhenExpiredDateThen404() throws SQLException {
        Event event = createValidEvent();
        event.setDate(new Date(0));

        ResponseEntity response = eventService.save(event, List.of(createValidBillet()));

        assertEquals("the event your trying to insert has an expired date",404L,(long) response.getCode());
    }

    @Test
    public void testSaveEventWhenInvalidUserThen404() throws SQLException {
        Event event = createValidEvent();

        when(userService.findByEmail(anyString())).thenReturn(new ResponseEntity("this user doesn't exist", 404));

        ResponseEntity response = eventService.save(event, List.of(createValidBillet()));

        assertEquals("this user doesn't exist", 404L, (long) response.getCode());
    }

    @Test
    public void testSaveEventWhenInvalidCategoryThen404() throws SQLException {
        Event event = createValidEvent();
        UserE user = createValidUser();
        Category category = createValidCategory();

        when(userService.findByEmail(anyString())).thenReturn(new ResponseEntity("successfully retrieved the user", 200, user));
        when(categoryService.findById(anyLong())).thenReturn(Optional.of(category));

        ResponseEntity response = eventService.save(event, List.of(createValidBillet()));

        assertEquals("the category you selected doesn't exist",404L,(long) response.getCode());
    }

    @Test
    public void testSaveEventWhenErrorSavingEventThen404() throws SQLException {
        Event event = createValidEvent();
        UserE user = createValidUser();
        Category category = createValidCategory();

        when(userService.findByEmail(anyString())).thenReturn(new ResponseEntity("successfully retrieved the user", 200, user));
        when(categoryService.findById(anyLong())).thenReturn(Optional.of(category));
        when(eventRepository.save(event)).thenReturn(false);

        ResponseEntity response = eventService.save(event, List.of(createValidBillet()));

        assertEquals("an error has occurred while adding this event please try again later",404L,(long) response.getCode());
    }

    private Event createValidEvent() {
        Event event = new Event();
        event.setName("Test Event");
        event.setDate(new Date(System.currentTimeMillis() + 86400000));
        event.setHour(Time.valueOf("12:00:00"));
        event.setLieu("Test Location");
        event.setDescription("Test Description");
        event.setCategory(createValidCategory());
        event.setUser(createValidUser());
        return event;
    }
    private Event createValidEventWithId(Long id) {
        Event event = new Event();
        event.setId(id);
        event.setName("Test Event");
        event.setDate(new Date(System.currentTimeMillis() + 86400000));
        event.setHour(Time.valueOf("12:00:00"));
        event.setLieu("Test Location");
        event.setDescription("Test Description");
        event.setCategory(createValidCategory());
        event.setUser(createValidUser());
        return event;
    }

    private UserE createValidUser() {
        UserE user = new UserE();
        user.setEmail("testuser@example.com");
        user.setPassword("password");
        user.setUsername("test");
        user.setFirstName("test1");
        user.setLastName("test2");
        return user;
    }

    private Category createValidCategory() {
        Category category = new Category();
        category.setId(1L);
        category.setName("Test Category");
        return category;
    }

    private Billet createValidBillet() {
        Billet billet = new Billet();
        billet.setBilletType(BilletType.STANDARD);
        billet.setPrix(200);
        billet.setQuantiteDisponible(30);
        return billet;
    }

    @Test
    public void testFindAllEvents() throws SQLException {
        Event event1 = new Event();
        event1.setId(1L);
        event1.setName("Event 1");

        Event event2 = new Event();
        event2.setId(2L);
        event2.setName("Event 2");

        List<Event> expectedEvents = Arrays.asList(event1, event2);

        when(eventRepository.getAllEvents()).thenReturn(expectedEvents);

        List<Event> actualEvents = eventService.findAll();

        assertEquals(expectedEvents, actualEvents);

        verify(eventRepository, times(1)).getAllEvents();
    }


    /*FindAll events function*/
    @Test()
    public void testFindAllEventsException() {
        when(eventRepository.getAllEvents()).thenThrow(new SQLException());

        assertThrows(SQLException.class,()->eventService.findAll());
    }


    /*Delete Event function*/
    @Test
    public void testDeleteEventWhenValidThenSuccess() throws SQLException {
        long eventId = 1L;
        Event event = createValidEventWithId(eventId);

        when(eventRepository.CalculateTicket(eventId)).thenReturn(0);
        when(eventRepository.findById(eventId)).thenReturn(event);
        when(eventRepository.delete(event)).thenReturn(true);

        ResponseEntity response = eventService.delete(eventId);

        assertEquals("this event has been successfully deleted",200L,(long) response.getCode());
    }

    @Test
    public void testDeleteEventWhenDoesNotExistThen404() throws SQLException {
        long eventId = 1L;

        when(eventRepository.CalculateTicket(eventId)).thenReturn(0);
        when(eventRepository.findById(eventId)).thenReturn(null);

        ResponseEntity response = eventService.delete(eventId);

        assertEquals("this event doesn't exist",404L,(long) response.getCode());
    }

    @Test
    public void testDeleteEventWhenWithSoldTicketsThen404() throws SQLException {
        long eventId = 1L;

        when(eventRepository.CalculateTicket(eventId)).thenReturn(10);

        ResponseEntity response = eventService.delete(eventId);

        assertEquals("you can't delete this event, as the ticket has already been sold",404L,(long) response.getCode());
    }

    @Test
    public void testDeleteEventWhenErrorThen404() throws SQLException {
        long eventId = 1L;
        Event event = createValidEventWithId(eventId);

        when(eventRepository.CalculateTicket(eventId)).thenReturn(0);
        when(eventRepository.findById(eventId)).thenReturn(event);
        when(eventRepository.delete(event)).thenReturn(false);

        ResponseEntity response = eventService.delete(eventId);

        assertEquals("an error has occurred while deleting this event please try again later",404L,(long) response.getCode());
    }

    @Test
    public void testDeleteWhenNullEventThen404() throws SQLException {
        ResponseEntity response = eventService.delete(null);

        assertEquals(404L,(long) response.getCode());
        assertEquals("this event doesn't exist", response.getMessage());
    }
}