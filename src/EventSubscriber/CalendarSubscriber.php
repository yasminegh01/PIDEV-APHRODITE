<?php

namespace App\EventSubscriber;

use App\Repository\DiagnosticRepository;
use CalendarBundle\CalendarEvents;
use CalendarBundle\Entity\Event;
use CalendarBundle\Event\CalendarEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;

class CalendarSubscriber implements EventSubscriberInterface
{
    private $diagnosticRepository;
    private $router;

    public function __construct(
        DiagnosticRepository $diagnosticRepository,
        UrlGeneratorInterface $router
    ) {
        $this->diagnosticRepository = $diagnosticRepository;
        $this->router = $router;
    }

    public static function getSubscribedEvents()
    {
        return [
            CalendarEvents::SET_DATA => 'onCalendarSetData',
        ];
    }

    public function onCalendarSetData(CalendarEvent $calendar)
    {
        $start = '2023-1-1 00:00:00';
        $end = date('Y-m-d H:i:s');
        $filters = $calendar->getFilters();

        // Modify the query to fit to your entity and needs
        // Change booking.beginAt by your start date property
        $diagnostics = $this->diagnosticRepository
            ->createQueryBuilder('diagnostic')
            ->where('diagnostic.date BETWEEN :start and :end')
            ->setParameter('start', $start)
            ->setParameter('end', $end)
            ->getQuery()
            ->getResult()
        ;

        foreach ($diagnostics as $diagnostic) {
            // this create the events with your data (here booking data) to fill calendar
            $test = new Event(
                'tested here',
                $diagnostic->getDate()
            );

            /*
             * Add custom options to events
             *
             * For more information see: https://fullcalendar.io/docs/event-object
             * and: https://github.com/fullcalendar/fullcalendar/blob/master/src/core/options.ts
             */

            $test->setOptions([
                'backgroundColor' => 'green',
                'borderColor' => 'green',
            ]);
            /*$bookingEvent->addOption(
                'url',
                $this->router->generate('app_booking_show', [
                    'id' => $diagnostic->getId(),
                ])
            );*/

            // finally, add the event to the CalendarEvent to fill the calendar
            $calendar->addEvent($test);
        }
    }
}